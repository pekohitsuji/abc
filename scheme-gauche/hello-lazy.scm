;#!
;;; -*- coding: utf-8-unix ; mode: scheme -*-
;;;
(define a
  (lcons (begin (print 'A) 1)
         (lcons (begin (print 'B) 2)
                (lcons (begin (print 'C) 3)
                       '()))))

(define b
  (lazy
   (cons (begin (print 'D) 4)
         (cons (begin (print 'E) 5)
               (cons (begin (print 'F) 6)
                     '())))))

(format #t "[~S]~%" "BAR")

(format #t "a         [~S]~%" a)
(format #t "(car   a) [~S]~%" (car   a))
(format #t "(cadr  a) [~S]~%" (cadr  a))
(format #t "(caddr a) [~S]~%" (caddr a))
(format #t "b         [~S]~%" b)
;; (format #t "(car   b) [~S]~%" (car   b))
;; (format #t "(cadr  b) [~S]~%" (cadr  b))
;; (format #t "(caddr b) [~S]~%" (caddr b))

(use gauche.lazy)
(define g (rec f (lcons 0 (lcons 1 (lmap + f (cdr f))))))

(format #t "       g  [~S]~%" g)
(format #t "(car   g) [~S]~%" (car   g))
(format #t "(cadr  g) [~S]~%" (cadr  g))
(format #t "(caddr g) [~S]~%" (caddr g)))
