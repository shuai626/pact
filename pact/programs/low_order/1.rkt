#lang racket
(define/contract (bake) (-> string?)
  (string-append "apple"))

(bake)
