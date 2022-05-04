#lang racket
(define/contract (bake flavor) (-> (-> (-> (-> (-> (-> string?))))) string?)
  (string-append flavor))