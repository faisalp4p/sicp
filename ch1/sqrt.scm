
(define (abs x) (if (< x 0) (- x) x))


(define (improved-is-good-enough? guess x) 
  (< (abs (- (improve guess x) guess))
     (* guess 0.001)))



(define (is-good-enough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (average x y) (/ (+ x y) 2)))


(define (improve guess x) (average guess (/ x guess)))


(define (sqrt-iter guess x) 
  (if (improved-is-good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))


(define (sqrt x) (sqrt-iter 1.0 x))

(sqrt 1000000000000000)
