;;; -*- coding: utf-8-unix ; mode: scheme -*-
;;;
(define-module abc.module.a (use abc.module.b) (export-all))
(select-module abc.module.a)

(define (go-a) (print "in go-a to go-b") (go-b))
