#!/usr/bin/guile --r7rs
!#
;;; -*- coding: utf-8 ; mode: scheme -*-
(import (rename (scheme base) (expt B:expt))
        (scheme write) (scheme inexact) (srfi srfi-28))
;;; R7RS では import や define-library の外は規定されてないので
;;; import や define-library の前にはコメントすら書かないほうが無難だが
;;; Guile は問題ないようだ

;;;
;;; SETUP 1
;;;     $ sudo apt-get install guile-3.0 guile-3.0-dev guile-3.0-doc
;;; SETUP 2
;;;     $ guile --r7rs
;;;     > (install-r7rs!)
;;; SETUP 3
;;;   Set GUILE_LOAD_PATH and export for your library
;;;
;;; RUN
;;;     $ guile abc.scm
;;;
;;; RESULT
;;;     WARNING: (guile-user): imported module (scheme base) overrides core binding `expt'
;;;     (scheme base) を import したらコアの expt を上書きした
;;;     - expt みたいなものを作って WARNING を回避してみた
;;;     - import で rename し、それを使った
;;;

(define (round-fp val n)
  (let* ((factor (B:expt 10 n)) ; (scheme base)
         #;(factor (let loop ((n n) (acc 1))
                   (cond ((<= n 0) acc) (else (loop (- n 1) (* acc 10))))))
         (rounded (/ (round (* val factor)) factor)))
    (number->string rounded))) ; (scheme base)

(display "Hello, world!\nGood-bye, human!")    ; display (scheme write)
(newline)                                      ; newline (scheme base)
(display "こんにちは 世界!\n")                 ; 日本語も使える
(display (format "円周率π=~a\n"               ; format (srfi srfi-28)
                 (round-fp (acos -1) 2)))      ; acos (scheme inexact)
