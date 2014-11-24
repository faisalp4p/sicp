(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))


(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))


(define (find-primes-iter start count start-time)
  (if (not (= count 0))
      (if (fast-prime? start 5)
          (begin (report-prime start (- (runtime) start-time))
                 (find-primes-iter (+ start 1) (- count 1) (runtime)))
          (find-primes-iter (+ start 1) count (runtime)))))


(define (find-primes start count)
  (newline)
  (find-primes-iter start count (runtime)))

(find-primes 100000000 3)
(find-primes 1000000000 3)
(find-primes 10000000000 3)
(find-primes 100000000000 3)

;(fast-prime? 7 7)
