;;; -*- coding: utf-8-unix ; mode: scheme -*-
;;;

(define-syntax repeat
  (syntax-rules ()
    [(_ n body ...)
     (let loop ((x n) (acc ()))
       (if (<= x 0) (reverse acc)
           (loop (- x 1) (cons (begin body ...) acc))))]))
    
(define tree '((a . b) (c . d) e))

(define bigtree (apply append (repeat 10000 tree)))

(define (leaf-count tree)
  (cond
   ((null? tree) 0) ;; ................... エンドポイント1
   ((not (pair? tree)) 1) ;; ............. エンドポイント2
   (else (+ (leaf-count (car tree))
            (leaf-count (cdr tree)))))) ;; 末尾呼び出し最適化できない

;;; 蓄積渡しでも末尾呼び出し最適化できない.
;;; エンドポイント以外で2つ以上の分岐の結果が必要になるから
(define (leaf-count/acc tree)
  (let loop ((tree tree) (acc 0))
    (cond
     ((null? tree) acc) ;; ................ エンドポイント1
     ((not (pair? tree)) (+ acc 1)) ;; .... エンドポイント2
     (else (+ (loop (car tree) acc)
              (loop (cdr tree) acc)))))) ;; 末尾呼び出し最適化できない

;;; 継続渡しなら末尾呼び出し最適化できる.
;;; スタックは消費しないが、生きているクロージャの数は再帰の数だけあり
;;; リソースの消費が減っているわけではない.
(define (leaf-count/cps tree)
  (let loop ((tree tree) (cont values))
    (cond
     ((null? tree) (cont 0)) ;; .................... エンドポイント1
     ((not (pair? tree)) (cont 1)) ;; .............. エンドポイント2
     (else (loop (car tree)
                 (lambda (n)
                   (loop (cdr tree)
                         (lambda (m)
                           (cont (+ n m)))))))))) ;; 末尾呼び出し最適化できる
