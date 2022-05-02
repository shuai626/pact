#lang racket
(require "stdlib.rkt" "parse.rkt" "compile.rkt" "read-all.rkt" "a86/printer.rkt" "remove-contracts.rkt")
(provide main)

;; -> Void
;; Compile contents of stdin
;; emit asm code on stdout
(define (main)
  (begin
    (read-line) ; ignore #lang racket line
    (current-shared? #t)
    (asm-display (compile (remove-contracts (parse (read-all)))))))
