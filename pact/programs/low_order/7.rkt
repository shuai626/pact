#lang racket
(define/contract (bake flavor x y z a b) (-> string? integer? integer? integer? integer? integer? string?)
  (string-append flavor))

(bake "apple" 1 2 3 4 5)
