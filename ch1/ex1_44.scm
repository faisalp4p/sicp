;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;
;;;;;;;   Excersise 1.44
;;;;;;;



(define (inc x) (+ x 1))

(define dx 0.00001)

(define (compose f g)
	(lambda (x)
		(f (g x))))

(define (repeat f n)
	(define (repeat-iter comp c)
		(if (= c n)
			comp
			(repeat-iter (compose comp f) (+ c 1))))
	(repeat-iter f 1))


(define (smooth f)
	(lambda (x) (/ (+ (f (+ x dx)) (f (- x dx)) (f x)) 3.0)))


(define (n-fold-smooth n)
	(repeat smooth n))

(((n-fold-smooth 3) inc) 6)

