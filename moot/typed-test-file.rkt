#lang typed/racket


(define (f (x : Integer) y) : Integer (let ((z : Integer 3)) (+ x z)))
((lambda ([a : String] b) : Boolean (equal? a b)) "hi" "bye")
(let ((x : Integer 3)) (f 4 x))

