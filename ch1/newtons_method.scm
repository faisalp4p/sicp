

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

(define (sqrt x)
	(newtons-method (lambda (y) (- (square y) x))
		1.0))

(sqrt 4)