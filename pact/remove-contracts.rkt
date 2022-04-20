#lang racket
(provide remove-contracts)
(require "ast.rkt"
         "env.rkt")

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

; id [Listof id] expr id id -> Defn
(define (expand-defcontract f g xs expr ins out)
  ; apply in contracts to all inputs
  (let* ([in-expr (foldl expand-incontract expr xs ins)]
        ; apply out contract
        [out-expr (expand-outcontract in-expr out)])
    (Defn f (Lam g xs out-expr))))

; id expr id -> expr
(define (expand-incontract x in expr)
  (If (App (Var in) (list (Var x))) expr (errorast "you")))

; id expr id -> expr
(define (expand-outcontract expr out)
  (let ([label (gensym "out")])
    ; Execute expression
    (Let (list label) (list expr)
         ; return label if App otherwise throw
         (If (App (Var out) (list (Var label))) (Var label)
             (errorast "me")))))


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