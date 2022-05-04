#lang racket
(define (outersum f n)
  (if (= n 0) 
      0 
      (+ (f n) (outersum f (- n 1)))))