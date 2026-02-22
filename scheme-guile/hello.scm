#!/usr/bin/guile
!#
;;; -*- coding: utf-8 ; mode: scheme -*-
;;;     - utf-8-unix と書くとエラーになる. 3行目以降でも!
;;;     - 3行目に書くしかないので Emacs には無視されるが
;;;       拡張子で sheme モードだと判断される.
(import (scheme base) (scheme write))
(display "Hello, world!\nGood-bye, human!")
(newline)
(display "こんにちは 世界!\n")
