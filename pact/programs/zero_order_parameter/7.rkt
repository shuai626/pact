#lang racket
(define/contract (bake flavor x y z a b c) (-> string? integer? integer? integer? integer? integer? integer? string?)
  (string-append flavor))