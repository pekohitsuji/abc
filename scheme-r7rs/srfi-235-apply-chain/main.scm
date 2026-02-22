(define-library (abc srfi-235-apply-chain)
;;; -*- coding: utf-8-unix ; mode: scheme -*-
  (import (only (srfi  28) format))
  (import (only (srfi 235) flip apply-chain))
  (export x2 x3 x5 apply-chain-left)
  (begin
    (define (x2 n)
      (let ((ret (* 2 n))) (format #t "(x2 ~A) => ~A~%" n ret) ret))

    (define (x3 n)
      (let ((ret (* 3 n))) (format #t "(x3 ~A) => ~A~%" n ret) ret))

    (define (x5 n)
      (let ((ret (* 5 n))) (format #t "(x5 ~A) => ~A~%" n ret) ret))

    (define apply-chain-left (flip apply-chain))))
