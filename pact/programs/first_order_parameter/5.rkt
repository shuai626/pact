#lang racket
(define/contract (bake flavor x y z a) (-> (-> string?) (-> string?) (-> string?) (-> string?) (-> string?) string?)
  (string-append flavor))
