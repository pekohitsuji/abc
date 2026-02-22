#!/usr/bin/gosh
;;; -*- coding: utf-8-unix ; mode: scheme -*-
(import (scheme base) (scheme write) (scheme show) (scheme inexact))
;;; R7RS では import や define-library の外は規定されてないので
;;; import や define-library の前にはコメントすら書かないほうが無難だが
;;; Gauche は問題ないようだ

;;;
;;; SETUP 1
;;;   - $ sudo apt-get install gauche
;;;         or
;;;   - Download get-gauche.sh from
;;;     https://practical-scheme.net/gauche/download.html
;;;   - `$ bash ./get-gauche.sh`
;;; SETUP 2
;;;     Set and export GAUCHE_LOAD_PATH for your library.
;;;
;;; RUN
;;;     $ gosh abc/scheme-gauche/abc
;;;

(display "Hello, world!\nGood-bye, human!") ; (scheme write) 行末に改行なし
(newline)                                   ; (scheme base)  改行
(display "こんにちは 世界!\n")              ; 日本語も使える
;; acos (scheme inexact)
(show #t "円周率π=" (with ((precision 2)) (acos -1)) nl) ; (scheme show)
