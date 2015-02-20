
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Excersise 1.43
;;;;;

(define (inc x) (+ x 1))

(define (compose f g)
	(lambda (x)
		(f (g x))))

(define (repeat f n)
	(define (repeat-iter comp c)
		(if (= c n)
			comp
			(repeat-iter (compose comp f) (+ c 1))))
	(repeat-iter f 1))

((repeat square 2) 5)

