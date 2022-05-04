#lang racket
(define/contract (bake flavor x y z a b c) (-> (-> (-> string?)) (-> (-> string?)) (-> (-> string?)) (-> (-> string?)) (-> (-> string?)) (-> (-> string?)) (-> (-> string?)) string?)
  (string-append flavor))
