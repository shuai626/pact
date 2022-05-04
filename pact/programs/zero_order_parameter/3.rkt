#lang racket
(define/contract (bake flavor x y) (-> string? integer? integer? string?)
  (string-append flavor))
