(define-library (abc scheme-guile hello-lib)
;;; -*- coding: utf-8 ; mode: scheme -*-
  (import (scheme base) (scheme write) (srfi srfi-28))
  (export hello)
  (begin
    (define (hello message)
      (display (format "~A~%" message))  ; (scheme write) (srfi srfi-28)
      (values))))                        ; (scheme base)
