#lang racket
(provide extract-last)

;; [Listof T] -> T 
(define (extract-last xs)
  (match xs
    ['() (raise "no last element")]
    [(cons x xs) #:when (empty? xs)
                 (list '() x)]
    [(cons x xs)
     (let ([ys (extract-last xs)])
       (list (cons x (car ys)) (car (cdr ys)))
    )]))
