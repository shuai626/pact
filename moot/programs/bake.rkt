#lang racket
(define/contract (bake flavor) (-> string? string?)
  (printf "preheating oven...\n")
  (string-append flavor " pie"))
(bake "apple")