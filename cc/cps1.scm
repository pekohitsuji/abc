;;; -*- coding: utf-8-unix ; mode: scheme -*-
;;;

(define (factorial n)
  (cond
   ((<= n 0) 1) ;; ..................... エンドポイント
   (else (* n (factorial (- n 1)))))) ;; 末尾呼び出し最適化できない

;;; 蓄積渡し
(define (factorial/acc n)
  (let loop ((n n) (acc 1))
    (cond
     ((<= n 0) acc) ;; ........... エンドポイント
     (else (loop (- n 1)
                 (* n acc)))))) ;; 末尾最適化できる

;;; 継続渡し
(define (factorial/cps n)
  (let loop ((n n) (cont values))
    (cond
     ((<= n 0) (cont 1)) ;; ........................ エンドポイント
     (else (loop (- n 1)
                 (lambda (x) (cont (* n x)))))))) ;; 末尾呼び出し最適化できる  
