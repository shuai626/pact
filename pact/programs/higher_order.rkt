#lang racket

(define (foo x y) (+ x (y "hello world")))
(define/contract (bake flavor) (-> (-> integer? (-> string? integer?) integer?) integer?) (flavor 10 string-length))
(bake foo)