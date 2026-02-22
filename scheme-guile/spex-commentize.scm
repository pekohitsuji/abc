#!/usr/bin/guile
!#
;;; -*- coding: utf-8 ; mode: scheme -*-


;;;
;;; 行ではなく S式をひとつだけコメントアウト.
;;;     本来 SRFI-62 らしいが見当たらない
;;;     guile では特に何かを import しなくても使える
;;;

(begin
  (display "Hello, world!\n")
  (display "Good-bye, human!!\n")
  #;(display "こんにちは世界!\n"))


;;;
;;; S式を複数個コメントアウト.
;;;     ただし、Emacs の scheme-mode はそれを認識できないので
;;;     使わないほうが無難

(begin
  (display "Hello, world!\n")
  (display "Good-bye, human!!\n")
  #; #; (display "こんにちは世界!\n") (display "さよなら 人類!\n"))
