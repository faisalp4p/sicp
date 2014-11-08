
(define (improve guess x) 
  (/ (+ (/ x (* guess guess) ) (+ 2 guess) ) 3) )


(define (abs x) (if (< x 0) (- x) x))

(define (is-good-enough guess x) 
  (< (abs (- (* guess guess guess) x )) 0.0001 ) )


(define (cube-root-iter guess x) 
  (if (is-good-enough guess x) guess
      (cube-root-iter (improve guess x) x)) )


(define (cube-root x) (cube-root-iter 1.0 x))

(cube-root 8)
