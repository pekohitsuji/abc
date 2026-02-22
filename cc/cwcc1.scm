;;; -*- coding: utf-8-unix ; mode: scheme -*-
;;;

;;; (foo n) を評価したときに作られる cc を束縛
;;; (bar n) も (foo n) を評価するので cc を束縛
(define save-cc)

(define (foo n)
  (if (odd? n)
      (* 3
         (+ 2
            (call/cc (lambda (cc) ;; cc ≡ (lambda (x) (* 3 (+ 2 x)))
                       (set! save-cc cc)
                       (cond ((< 10 n) (cc 1))
                             (else n))))))
      (list 1
            (call/cc (lambda (cc) ;; cc ≡ (lambda (x) (list 1 x 2))
                       (set! save-cc cc)
                       (cond ((< 10 n) (cc 4))
                             (else 'foo))))
            2)))
                           
(define (bar n)
  (if (odd? n)
      (* 5 (foo n))
      (cons 0 (foo n))))

;;; (foo 7)    ;=> 27
;;; (save-cc 7) ;=> 27
;;; (bar 7)    ;=> 135
;;; (save-cc 7) ;=> 135
;;; cc は関数の境界なしで、トップレベルに戻るまでの手順になってる！

;;; gauche, PLT scheme では let/cc の名のマクロ
(define-syntax ccc
  (syntax-rules ()
    [(_ var body ...) (call/cc (lambda (var) body ...))]))
