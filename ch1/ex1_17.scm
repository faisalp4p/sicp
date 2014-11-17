(define (even? x) 
  (= (remainder x 2) 0))

(define (double x) (+ x x))

(define (halve x) (/ x 2))

(define (fast-mult a b c)
  (cond ((= b 0) c)
	((even? b) (fast-mult (double a) (halve b) c) )
	(else (fast-mult a (- b 1) (+ c a )))))

(fast-mult 4 5 0)