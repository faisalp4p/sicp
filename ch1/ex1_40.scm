;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;    Excersise 1.40 
;;;

(define tolerance 0.00001)

(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))

(define dx 0.00001)

(define (derive g)
	(lambda (x)
		(/ (- (g (+ x dx)) (g x))
			dx)))

(define (newton-transform g)
	(lambda (x)
		(- x (/ (g x) ((derive g) x)))))

(define (newtons-method g guess)
	(fixed-point (newton-transform g) guess))

(define (cubic a b c)
	(newtons-method (lambda (x) (+ (* x x x) (* a x x) (* b x) c)) 1.0))

(cubic 1.0 2.0 3.0)