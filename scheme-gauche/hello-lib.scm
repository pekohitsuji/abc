(define-library (abc scheme-gauche hello-lib)
;;; -*- coding: utf-8-unix ; mode: scheme -*-
  (import (scheme base))
  (import (srfi 28))
  (export hello)
  (begin
    (define (hello name)
      (format #t "~A~%" name)  ; (srfi 28)
      (values))))              ; (scheme base)
