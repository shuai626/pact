#lang racket
(define/contract (bake flavor x y) (-> (-> string?) (-> string?) (-> string?) string?)
  (string-append flavor))
