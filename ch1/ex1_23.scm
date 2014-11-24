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


(smallest-devisor 14)