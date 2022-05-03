#lang racket
(define (foo) ("apple"))
(define (bar) (foo))
(define (bizz) (bar))
(define (buzz) (bizz))
(define (fuzz) (buzz))
(define (jazz) (fuzz))
(define/contract (bake flavor) (-> (-> (-> (-> (-> (-> (-> string?)))))) string?)
  (string-append flavor))

(bake jazz)