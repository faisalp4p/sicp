;;;;   SICP excersise 1.30


;;;;;;;;;; following is the new iterative sum procedure

(define  (sum term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (+ result (term a) ) )))
	(iter a 0))

;;;;;;;;;;;;;;;;;;;; end ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; increment method
(define (inc n) (+ n 1))


;; cube function
(define (cube n) (* n n n))


;; simpson's integral rule implementation

(define (integral-simpson f a b n)
	(define h (/ (- b a) n))
	(define (coe x) (cond ((= 0 x) 1 )
		((= x n) 1)
		((= (remainder x 2) 0) 2)
		((= (remainder x 2) 1) 4)))
	(define (custom-term x) (* (coe x) (f (+ a (* x h)) ) ) )
	(* (sum custom-term 0 inc n) (/ h 3)))


;;; calculating integral of cube from 0 to 1
(integral-simpson cube 0.0 1 1000)