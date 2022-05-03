#lang racket
(define (foo) ("apple"))
(define (bar) (foo))
(define (bizz) (bar))
(define (buzz) (bizz))
(define (fuzz) (buzz))
(define (jazz) (fuzz))
(define/contract (bake) (-> string?)
  (string-append "apple"))

(bake)
