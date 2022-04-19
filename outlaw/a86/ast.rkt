#lang racket
(provide (all-defined-out))

(struct Text   ()         #:prefab)
(struct Data   ()         #:prefab)

(struct Global (x)         #:prefab)
(struct Label  (x)         #:prefab)
(struct Call   (x)         #:prefab)
(struct Ret    ()         #:prefab)
(struct Mov    (dst src)         #:prefab)
(struct Add    (dst src)         #:prefab)
(struct Sub    (dst src)         #:prefab)
(struct Cmp    (a1 a2)         #:prefab)
(struct Jmp    (x)         #:prefab)
(struct Je     (x)         #:prefab)
(struct Jne    (x)         #:prefab)
(struct Jl     (x)         #:prefab)
(struct Jle    (x)         #:prefab)
(struct Jg     (x)         #:prefab)
(struct Jge    (x)         #:prefab)
(struct And    (dst src)         #:prefab)
(struct Or     (dst src)         #:prefab)
(struct Xor    (dst src)         #:prefab)
(struct Sal    (dst i)         #:prefab)
(struct Sar    (dst i)         #:prefab)
(struct Push   (a1)         #:prefab)
(struct Pop    (a1)         #:prefab)
(struct Lea    (dst x)         #:prefab)
(struct Div    (den)         #:prefab)

(struct Offset (r i)         #:prefab)
(struct Extern (x)         #:prefab)

(struct Equ    (x v)         #:prefab)
(struct Const  (x)         #:prefab)
(struct Dd (x)         #:prefab)
(struct Dq (x)         #:prefab)
(struct Plus (e1 e2)         #:prefab)

;; (U Instruction Asm) ... -> Asm
;; Convenient for sequencing instructions or groups of instructions
(define (seq . xs)
  (foldr (λ (x is)
           (if (list? x)
               (append x is)
               (cons x is)))
         '()
         xs))

(define (register? x)
  (and (memq x '(cl eax rax rbx rcx rdx rbp rsp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15))
       #t))

(define (exp? x)
  (or (Offset? x)
      (and (Plus? x)
           (exp? (Plus-e1 x))
           (exp? (Plus-e2 x)))
      (symbol? x)
      (integer? x)))

(define offset? Offset?)

(define (label? x)
  (and (symbol? x)
       (not (register? x))))

(define (instruction? x)
  (or (Text? x)
      (Data? x)
      (Global? x)
      (Label? x)
      (Extern? x)
      (Call? x)
      (Ret? x)
      (Mov? x)
      (Add? x)
      (Sub? x)
      (Cmp? x)
      (Jmp? x)
      (Je? x)
      (Jne? x)
      (Jl? x)
      (Jle? x)
      (Jg? x)
      (Jge? x)
      (And? x)
      (Or? x)
      (Xor? x)
      (Sal? x)
      (Sar? x)
      (Push? x)
      (Pop? x)
      (Lea? x)
      (Div? x)
      ;(Comment? x)
      (Equ? x)
      (Dd? x)
      (Dq? x)))