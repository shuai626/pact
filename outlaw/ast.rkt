#lang racket
(provide (all-defined-out))

;; type Prog = (Prog (Listof Defn))
(struct Prog (ds))

;; type Lib = (Lib (Listof Id) (Listof Defn))
(struct Lib (ids ds))

;; type Defn = (Defn Id Lambda)
(struct Defn (f l))

;; type Expr   = (Eof)
;;             | (Quote Datum)
;;             | (Prim Op (Listof Expr))
;;             | (If Expr Expr Expr)
;;             | (Begin [Listof Expr])
;;             | (Let (Listof Id) (Listof Expr) Expr)
;;             | (Var Id)
;;             | (Match Expr (Listof Pat) (Listof Expr))
;;             | (App Expr (Listof Expr))
;;             | Lambda
;;             | (Apply Expr (Listof Expr))
;; type Lambda = (Lam Id (Listof Id) Expr)
;;             | (LamRest Id (Listof Id) Id Expr)
;;             | (LamCase Id (Listof LamCaseClause))
;; type LamCaseClause =
;;             | (Lam Id (Listof Id) Expr)
;;             | (LamRest Id (Listof Id) Expr)
;; type Datum = Integer
;;            | Char
;;            | Boolean
;;            | String
;;            | Symbol
;;            | (Boxof Datum)
;;            | (Listof Datum)
;;            | (Vectorof Datum)
;; type Id    = Symbol
;; type Op    = Op0 | Op1 | Op2 | Op3
;; type Op0   = 'read-byte
;; type Op1   = 'add1 | 'sub1 | 'zero?
;;            | 'char? | 'integer->char | 'char->integer
;;            | 'write-byte | 'eof-object?
;;            | 'box | 'car | 'cdr | 'unbox
;;            | 'empty? | 'cons? | 'box?
;;            | 'vector? | 'vector-length
;;            | 'string? | 'string-length
;;            | 'symbol? | 'symbol->string
;;            | 'string->symbol | 'string->uninterned-symbol
;; type Op2   = '+ | '- | '< | '=
;;            | 'cons
;;            | 'make-vector | 'vector-ref
;;            | 'make-string | 'string-ref
;;            | 'struct?
;; type Op3   = 'vector-set! | 'struct-ref
;; type OpN   = 'make-struct
;; type Pat   = (PVar Id)
;;            | (PWild)
;;            | (PLit Lit)
;;            | (PBox Pat)
;;            | (PCons Pat Pat)
;;            | (PAnd Pat Pat)
;;            | (PSymb Symbol)
;;            | (PStr String)
;;            | (PStruct Id (Listof Pat))
;;            | (PPred Expr)
;; type Lit   = Boolean
;;            | Character
;;            | Integer
;;            | '()

(struct Eof     ())
(struct Prim    (p es))
(struct If      (e1 e2 e3))
(struct Begin   (es))
(struct Let     (xs es e))
(struct Var     (x))
(struct App     (e es))
(struct Lam     (f xs e))
(struct LamRest (f xs x e))
(struct LamCase (f cs))
(struct Apply   (e es el))
(struct Quote   (d))
(struct Match   (e ps es))

(struct PVar  (x))
(struct PWild ())
(struct PLit  (x))
(struct PBox  (p))
(struct PCons (p1 p2))
(struct PAnd  (p1 p2))
(struct PSymb (s))
(struct PStr (s))
(struct PStruct (n ps))
(struct PPred (e))
