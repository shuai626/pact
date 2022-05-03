#lang racket
(define/contract (bake flavor x) (-> string? integer? string?)
  (string-append flavor))

(bake "apple" 1)
