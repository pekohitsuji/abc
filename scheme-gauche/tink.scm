;;; -*- coding: utf-8-unix ; mode: scheme -*-

(define nlist '(1 2 3))
(define ini 9)

;;;
;;; 末尾再帰 acc <= (func (car lst) acc)
;;; (func en ... (func e2 (func e1 ini)))
;;;
(define (my-fold func acc lst)
  (if (null? lst)
      acc
      (my-fold func (func (car lst) acc) (cdr lst))))


;;;
;;; 末尾再帰 acc <= (func acc (car lst))
;;; (func (... (func (func ini e1) e2) ...) en)
;;;
(define (my-fold-left func acc lst)
  (if (null? lst)
      acc
      (my-fold-left func (func acc (car lst)) (cdr lst))))


;;;
;;; 末尾再帰ではない fold-right
;;; (func e1 (func e2 ... (func en ini)))
;;;
(define (my-fold-right func ini lst)
  (if (null? lst)
      ini
      (func (car lst) (my-fold-right func ini (cdr lst)))))


(format #t "fold:           ~S~%" (fold          cons ini nlist))
(format #t "my-fold:        ~S~%" (my-fold       cons ini nlist))

(format #t "fold-left:      ~S~%" (fold-left     cons ini nlist))
(format #t "my-fold-left:   ~S~%" (my-fold-left  cons ini nlist))

(format #t "fold-right:     ~S~%" (fold-right    cons ini nlist))
(format #t "my-fold-right:  ~S~%" (my-fold-right cons ini nlist))
