;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;
;;;;;;;   Excersise 1.46
;;;;;;;


;;;;   iterative-improve function

(define (iterative-improvement good-enough? improvement-proc)
	(lambda (x)
		(define (iter current next)
			(if (good-enough? current next)
				next
				(iter next (improvement-proc next))))
		(iter x (improvement-proc x))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (average x y)
	(/ (+ x y) 2	))


(define tolerance 0.000001)

(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))

(define (average-damp f)
	(lambda (x) (average x (f x))))

;;;;;;;;;;;;;; code for fixed point

(define (fixed-point f first-guess)
	((iterative-improvement close-enough? (average-damp f)) first-guess))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;  re written sqrt procedure from section 1.1.7

(define (good-guess? x)
	(lambda (old current) (< (abs (- (square current) x)) 0.001)))

(define (improve x)
	(lambda (current) (average current (/ x current))))

(define (sqrt-iter guess x)
	((iterative-improvement (good-guess? x) (improve x)) guess))

(define (sqrt x)
	(sqrt-iter 1.0 x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(sqrt 9)