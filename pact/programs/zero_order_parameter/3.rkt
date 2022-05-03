#lang racket
(define/contract (bake flavor x) (-> string? integer? string?)
  (string-append flavor))
