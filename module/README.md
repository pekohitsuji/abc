<!-- coding: utf-8-unix ; mode: markdown -->

## abc.module.a
```
;;; -*- coding: utf-8-unix ; mode: scheme -*-
;;;
(define-module abc.module.a (use abc.module.b) (export-all))
(select-module abc.module.a)

(define (go-a) (print "in go-a to go-b") (go-b))
```

## abc.module.b
```
;;; -*- coding: utf-8-unix ; mode: scheme -*-
;;;
(define-module abc.module.b (use abc.module.c) (export-all))
(select-module abc.module.b)

(define (go-b) (print "in go-b to go-c") (go-c))
```

## abc.module.c
```
;;; -*- coding: utf-8-unix ; mode: scheme -*-
;;;
(define-module abc.module.c (export-all))
(select-module abc.module.c)

(define (go-c) (print "in go-c to end"))
```

## 実行
```
$ gosh
gosh> (use abc.module.a)  ;; user は a だけ use
gosh> (go-a)
in go-a to go-b
in go-b to go-c
in go-c to end
#<undef>
gosh> (go-b)  ;; user は b を use してない
*** ERROR: unbound variable: go-b
Stack Trace:
_______________________________________
  0  (go-b)
        at "(standard input)":3
  1  (eval expr env)
        at "/usr/share/gauche-0.98/0.9.12/lib/gauche/interactive.scm":336
gosh> (go-b)  ;; user は c は use してない
*** ERROR: unbound variable: go-c
Stack Trace:
_______________________________________
  0  (go-c)
        at "(standard input)":2
  1  (eval expr env)
        at "/usr/share/gauche-0.98/0.9.12/lib/gauche/interactive.scm":336
gosh> (select-module abc.module.a)  ;; a を select-module
gosh[abc.module.a]> (go-a)
in go-a to go-b
in go-b to go-c
in go-c to end
#<undef>
gosh[abc.module.a]> (go-b)  ;; a は b を use している
in go-b to go-c
in go-c to end
#<undef>
gosh[abc.module.a]> (go-c)  ;; a は c を use してない
*** ERROR: unbound variable: go-c
Stack Trace:
_______________________________________
  0  (go-c)
        at "(standard input)":7
  1  (eval expr env)
        at "/usr/share/gauche-0.98/0.9.12/lib/gauche/interactive.scm":336
gosh[abc.module.a]>
```
