#lang racket
(define/contract (bake flavor x y z) (-> (-> (-> string?)) (-> (-> string?)) (-> (-> string?)) (-> (-> string?)) string?)
  (string-append flavor))
