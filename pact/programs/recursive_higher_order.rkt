#lang racket
(define (sum n) (if (= n 0) 0 (+ n (sum (- n 1)))))

(define/contract (outersum f n) (-> (-> integer? integer?) integer? integer?) 
  (if (= n 0) 
      0 
      (+ (f n) (outersum f (- n 1)))))

(outersum sum 5)