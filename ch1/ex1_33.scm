;;;;;;;;;  SICP Excersise 1.33

;;;;;;; procedures to check prime

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n a)
  (= (expmod a n n) a))


(define (fast-prime-iter n times)
  (cond ((= times 0) true)
	((fermat-test n times) (fast-prime-iter n (- times 1)))
	(else false)))

(define (prime? n)
  (fast-prime-iter n (- n 1)))

;;;;;;;  end of procedures to find prime




;;;;;; accumulator function with filter (a)

(define (filtered-accumulate combiner filter null-value term a next b)
	(if (> a b)
		null-value
		(if (filter a)
			(combiner (term a) (filtered-accumulate combiner filter null-value term (next a) next b))
			(combiner null-value (filtered-accumulate combiner filter null-value term (next a) next b)))))


;;; square function
(define (square x) (* x x))

;;; identity function
(define (identity n) n)


;;; increment function
(define (inc n) (+ n 1))


(define (squares-of-prime a b)
	(filtered-accumulate + prime? 0 square a inc b))

(squares-of-prime 0 10)


;;;;;;;;;;;;;;;;;;;;;;;;;;; (b)

;; gdc procedure
(define (gcd n a)
	(if (= a 0)
		n
		(gcd a (remainder n a))))

(define (fun n)
	(define (relatively-prime? a) (= 1 (gcd n a)))
	(filtered-accumulate * relatively-prime? 1 identity 1 inc n))

(fun 5)