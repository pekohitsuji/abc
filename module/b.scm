;;; -*- coding: utf-8-unix ; mode: scheme -*-
;;;
(define-module abc.module.b (use abc.module.c) (export-all))
(select-module abc.module.b)

(define (go-b) (print "in go-b to go-c") (go-c))
