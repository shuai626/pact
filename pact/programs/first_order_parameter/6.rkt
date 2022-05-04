#lang racket
(define/contract (bake flavor x y z a b) (-> (-> string?) (-> string?) (-> string?) (-> string?) (-> string?) (-> string?) string?)
  (string-append flavor))
