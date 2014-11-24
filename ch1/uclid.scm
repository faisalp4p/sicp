(define (gcd x y)
  (if (= y 0) x (gcd y (remainder x y))))

(gcd 206 40)