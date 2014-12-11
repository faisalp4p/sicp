;;;;   SICP excersise 1.29


;;; sum method to demostrate higher order function
(define  (sum term a next b)
	(if (> a b)
		0
		(+ (term a)
			(sum term (next a) next b))))
;;;


;; increment method
(define (inc n) (+ n 1))


;; cube function
(define (cube n) (* n n n))

;;;;;  following is the new integral procedure based on Simpson's rule

(define (integral-simpson f a b n)
	(define h (/ (- b a) n))
	(define (coe x) (cond ((= 0 x) 1 )
		((= x n) 1)
		((= (remainder x 2) 0) 2)
		((= (remainder x 2) 1) 4)))
	(define (custom-term x) (* (coe x) (f (+ a (* x h)) ) ) )
	(* (sum custom-term 0 inc n) (/ h 3)))

;;;;;;;;;;;;;;;;;;;; end ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; calculating integral of cube from 0 to 1
(integral-simpson cube 0.0 1 1000)