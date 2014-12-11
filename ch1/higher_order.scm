
;;;;;; This file contains the examples in SICP section 1.3 (Higher order function) 


;;; sum function
(define  (sum term a next b)
	(if (> a b)
		0
		(+ (term a)
			(sum term (next a) next b))))



;;; identity function
(define (identity x) x)

;;; increment function
(define (inc n) (+ n 1))

;;; cube function
(define (cube n) (* n n n))

;(sum cube 1 inc 2)

;;; defining integral function to calculate integral of a function from 0 to 1
(define (integral f a b dx)
	(define (add-dx x) (+ x dx))
	(* (sum f (+ a (/ dx 2.0)) add-dx b)
		dx))

;;; calculating integral of cube from 0 to 1
(integral cube 0 1 0.001)
