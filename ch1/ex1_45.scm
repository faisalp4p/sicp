;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;
;;;;;;;   Excersise 1.45
;;;;;;;




(define (compose f g)
	(lambda (x)
		(f (g x))))

(define (average x y)
	(/ (+ x y) 2	))

(define tolerance 0.00001)

(define (repeat f n)
	(define (repeat-iter comp c)
		(if (= c n)
			comp
			(repeat-iter (compose comp f) (+ c 1))))
	(repeat-iter f 1))


(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))


(define (average-damp f)
	(lambda (x) (average x (f x))))

(define (nested-average-damp n)
	(repeat average-damp n))


(define (sqrt x)
	(fixed-point (average-damp (lambda(y) (/ x y)))
		1.0))


(define (cube-root x)
	(fixed-point (average-damp (lambda(y) (/ x (* y y))))
		1.0))


(define (fourth-root x)
	(fixed-point ( (nested-average-damp 2) (lambda(y) (/ x (* y y y))))
		1.0))

(define (fifth-root x)
	(fixed-point ( (nested-average-damp 2) (lambda(y) (/ x (* y y y y))))
		1.0))

(define (sixth-root x)
	(fixed-point ( (nested-average-damp 2) (lambda(y) (/ x (* y y y y y))))
		1.0))

(define (seventh-root x)
	(fixed-point ( (nested-average-damp 2) (lambda(y) (/ x (* y y y y y y))))
		1.0))


(define (eighth-root x)
	(fixed-point ( (nested-average-damp 3) (lambda(y) (/ x (* y y y y y y y))))
		1.0))

(eighth-root 256)