;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;
;;;;;;;;   Excersise 2.1




(define (make-rat x y)
  (let ((newx (if (< (* x y) 0) (- (abs x)) (abs x)))
        (newy (abs y)))
    (cons newx newy)))

(define numer car)
(define denom cdr)

(define r (make-rat -4 5))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat r)
