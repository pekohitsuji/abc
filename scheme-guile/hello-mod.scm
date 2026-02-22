(define-module (abc scheme-guile hello-lib)
;;; -*- coding: utf-8 ; mode: scheme -*-
  :export (hello))

(define (hello name)
  (format #t "~A~%" name)  ; (srfi 28)
  (values))                ; (scheme base)
