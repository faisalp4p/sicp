(define tolerance 0.00001)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;    Excersise 1.36
;;;;


(define (average x y)
	(/ (+ x y) 2))

(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(let ((next (f guess)))
			(display guess)
			(newline)
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))

(define logk (log 1000))

;;;; without average damping
(fixed-point (lambda (x) (/ logk (log x))) 2.0)
;; took about 35 steps


;;; with average damping
(fixed-point (lambda (x) (average x (/ logk (log x)))) 2.0)
;;;; took only 10 steps