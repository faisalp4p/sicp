File Edit Options Buffers Tools Scheme Help                                                                                                                       
(define (devides? a b)
  (= (remainder b a) 0))

(define (square n) (* n n))

(define (even? n)
  (devides?  n 2))

(define (next n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))


(define (smallest-devisor n)
  (find-devisor n 2))

(define (find-devisor n test-devisor)
  (cond ((> (square test-devisor) n) n)
	((devides? test-devisor n) test-devisor)
	(else (find-devisor n (next test-devisor)))))

(define (prime? n)
  (= n (smallest-devisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes low high)
  (if (not (devides? low 2)) (timed-prime-test low) )
  (if (< low high) (search-for-primes (+ low 1) high) ))

;(search-for-primes 2000000 2010000)

(define (find-primes-iter start count start-time)
  (if (not (= count 0)) 
      (if (prime? start)
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