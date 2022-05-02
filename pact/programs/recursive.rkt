#lang racket
(define/contract (sum n) (-> integer? integer?) (if (= n 0) 0 (+ n (sum (- n 1)))))

(sum 10)