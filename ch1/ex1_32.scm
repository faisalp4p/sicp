;;;;;; SICP excersise 1.32


;;;; accumulator function. a general notion of sum and product (recursive) 
(define (accumulate combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (term a) (accumulate combiner null-value term (next a) next b))))


;;; identity function
(define (identity x) x)

;;; increment function
(define (inc n) (+ n 1))


;;;;;;;;  iterative accumulator function (b)

(define (accumulate combiner null-value term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (combiner (term a) result))))
	(iter a null-value))


(accumulate + 0 identity 1 inc 10) ;; counting from 1 to 10
(accumulate * 1 identity 1 inc 5)  ;; factorial of n