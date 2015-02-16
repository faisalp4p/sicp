;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Excersise 1.41
;;;;;

(define (inc x)
	(+ x 1))

(define (double proc)
	(lambda (x) (proc (proc x)) ))

((double inc) 5)

(((double (double double)) inc) 5)
