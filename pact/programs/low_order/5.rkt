#lang racket
(define/contract (bake flavor x y z) (-> string? integer? integer? integer? string?)
  (string-append flavor))

(bake "apple" 1 2 3)
