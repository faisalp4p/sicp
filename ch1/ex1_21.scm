(define (smallest-devisor n)
  (find-devisor n 2))

(define (find-devisor n test-devisor)
  (cond ((> (square test-devisor) n) n)
	((devides? test-devisor n) test-devisor)
	(else (find-devisor n (+ test-devisor 1)))))

(define (devides? a b)
  (= (remainder b a) 0))

(smallest-devisor 199)
(smallest-devisor 1999)
(smallest-devisor 19999)