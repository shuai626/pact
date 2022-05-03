#lang racket
(define/contract (bake flavor x) (-> (-> (-> string?)) (-> (-> string?)) string?)
  (string-append flavor))
