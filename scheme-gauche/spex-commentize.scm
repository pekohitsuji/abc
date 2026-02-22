#!/usr/bin/gosh
;;; -*- coding: utf-8-unix ; mode: scheme -*-
(import (scheme base) #;(scheme write) (scheme show) #;(scheme inexact))

;;;
;;; 行ではなく S式をひとつだけコメントアウトするサンプル.
;;;     本来 SRFI-62 らしいが見当たらない
;;;     gosh では特に何かを import しなくても使える
;;;

(begin
  (show #t "Hello, world!" nl)
  (show #t "Good-bye, human!" nl)
  #;(show #t "こんにちは 世界!" nl))  ;; 最後の閉じ括弧は生きている！


;;;
;;; S式を複数個コメントアウト.
;;;     ただし、Emacs の scheme-mode はそれを認識できないので
;;;     使わないほうが無難

(begin
  (show #t "Hello, world!" nl)
  (show #t "Good-bye, human!" nl)
  #; #; (show #t "こんにちは 世界!" nl) (show #t "さよなら 人類!" nl))
