;;;;;; SICP excersise 1.31


;;; identity function
(define (identity x) x)

;;; increment function
(define (inc n) (+ n 1))


;;; product function similar to sum
(define  (product term a next b)
	(if (> a b)
		1
		(* (term a)
			(product term (next a) next b))))


;;;;;;  procedure to find factorial of a number using product higher order function

(define (fact n)
	(product identity 1 inc n))

(fact 6)

;;;;;;  procedure to find approximation to pi

(define (pi-term n)
	(* (/ n (- n 1)) (/ n (+ n 1) ))) 

(define (pi-next n) (+ n 2))

(define (product-pi)
	(* (/ 8.0 3.0) (product pi-term 4 pi-next 10000)))

(product-pi)

;;;;;;  above product function generates a recursive procedure, now we implement in iterative

(define  (product term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (* result (term a) ) )))
	(iter a 1))