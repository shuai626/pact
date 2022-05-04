#lang racket
(define/contract (bake flavor x y z a b) (-> string? integer? integer? integer? integer? integer? string?)
  (string-append flavor))