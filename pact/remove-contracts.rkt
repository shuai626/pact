#lang racket
(provide remove-contracts)
(require "ast.rkt"
         "env.rkt"
         "parse-utils.rkt")

; Prog -> Prog
(define (remove-contracts p)
  (match p
    [(Prog ds)
     (expand-defcontracts ds)]))

; Prog -> Prog
(define (expand-defcontracts ds)
  (let ([ds-expanded (map map-defs ds)])
    (Prog ds-expanded)))

(define (map-defs d)
  (match d
    ; When contract is found
    [(DefnContract (Defn f (Lam g xs expr)) ins out)
     (expand-defcontract f g xs expr ins out)]
    ; identity otherwise
    [x x]))

; id id [Listof id] expr [Listof Predicate] Predicate -> Defn
(define (expand-defcontract f g xs expr ins out)
  ; apply in contracts to all inputs
  (let* ([in-expr (foldl expand-contract expr xs ins)]
        ; apply out contract
        [out-expr (expand-outcontract in-expr out)])
    (Defn f (Lam g xs out-expr))))

; expr Predicate -> expr
(define (expand-outcontract expr out)
  (let ([label (gensym "out")])
    ; Assign new variable to expression output and expand the out contract
    (Let (list label) (list expr) (expand-contract label out (Var label)))))

; id Predicate expr
(define (expand-contract x c expr)
  (match c
    [(? list? c) (expand-higher-contract expr x c)]
    [(? symbol? c) (If (App (Var c) (list (Var x))) expr (errorast "you"))]
    [_ (errorast "someone")]))

; expr id (Listof Predicate) -> expr
(define (expand-higher-contract expr x cs)
  (match (extract-last cs)
    [(cons ins out)
     ; Get variables for the lambda
     (let ([syms (n-syms (length ins) "hcon")])
       ; Reassign higher order contract variable to a lambda expression
       (Let (list x)
            (list (Lam (gensym "lam")
                       syms
                       ; Lambda expression calls original input var (presumably a function)
                       ; with the generated variables. Then the in and out contracts are
                       ; expanded "around" the call.
                       (expand-outcontract
                        (foldl expand-contract (App (Var x) (map Var syms)) syms ins)
                        (car out))))
            expr))]))

; Helper for generating error messages
(define (errorast str)
  (Prim 'error (list (Quote str))))

; Zip two lists
(define (zip xs ys)
  (match* (xs ys)
    [('() '()) '()]
    [((cons x xs) (cons y ys))
     (cons (list x y)
           (zip xs ys))]))

; Produce N gensym symbols
; int [Optional str] -> [Listof symbol]
(define (n-syms n [label ""])
  (match n
    [0 '()]
    [n (cons (gensym label) (n-syms (sub1 n) label))]))
