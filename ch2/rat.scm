

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))


(define make-rat cons) ; version 1 without reduce
(define numer car)
(define denom cdr)


(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))



(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))


(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))


(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))




(define r1 (make-rat 1 2))
(define r2 (make-rat 3 5))
(define sm (add-rat r1 r2))
(print-rat sm)


