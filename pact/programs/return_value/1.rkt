#lang racket
(define/contract (outersum f n) (-> (-> integer? (-> integer? integer?) integer?) (-> integer? (-> integer?) integer?) integer?) 
  (if (= n 0) 
      0 
      (+ (f n) (outersum f (- n 1)))))