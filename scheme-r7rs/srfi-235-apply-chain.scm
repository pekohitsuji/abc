(define-library (abc srfi-235-apply-chain)
;;; -*- coding: utf-8-unix ; mode: scheme -*-
;;;
;;; srfi-235 の apply-chain を試す.
;;;
;;; > (import (abc srfi-235-apply-chain))
;;;
;;; > ((apply-chain x2 x3 x5) 3)
;;; =| (x5 3) => 15
;;; =| (x3 15) => 45
;;; =| (x2 45) =>90
;;; => 90
;;;
;;; > ((apply-chain-left x2 x3 x5) 3)
;;; =| (x2 3) => 6
;;; =| (x3 6) => 18
;;; =| (x5 18) => 90
;;; => 90
;;;
;;; > ((apply-chain y1 y2) (list 3 7))
;;; =| (y2 3 7) => (5 9)
;;; =| (y1 5 9) => (6 10)
;;; => (6 10)
;;;
  (import (scheme base))
  (import (only (srfi  28) format))
  (import (only (srfi 235) flip apply-chain))
  ;; import したものをエクスポートできる
  (export apply-chain quote list values)
  (export apply-chain-left x2 x3 x5 y1 y2)
  (begin
    (define apply-chain-left (flip apply-chain))

    (define (x2 n)
      (let ((ret (* 2 n))) (format #t "(x2 ~A) => ~A~%" n ret) ret))

    (define (x3 n)
      (let ((ret (* 3 n))) (format #t "(x3 ~A) => ~A~%" n ret) ret))

    (define (x5 n)
      (let ((ret (* 5 n))) (format #t "(x5 ~A) => ~A~%" n ret) ret))

    (define (y1 xs)
      (let* ((a (car  xs)) (b (cadr xs))
             (ret (cons (+ 1 a) (list (+ 1 b)))))
        (format #t "(y1 ~A ~A) => ~A~%" a b ret) ret))

    (define (y2 xs)
      (let* ((a (car  xs)) (b (cadr xs))
             (ret (cons (+ 2 a) (list (+ 2 b)))))
        (format #t "(y2 ~A ~A) => ~A~%" a b ret) ret))))
