


(define (average x y)
	(/ (+ x y) 2))


(define (make-rat x y)
  (let ((newx (if (< (* x y) 0) (- (abs x)) (abs x)))
        (newy (abs y)))
    (cons newx newy)))


(define numer car)
(define denom cdr)


(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-point x y)
	(cons x y))

(define (x-point p)
	(car p))

(define  (y-point p)
	(cdr p))

(define (make-segment p1 p2)
	(cons p1 p2))

(define (start-segment seg)
	(car seg))

(define (end-segment seg)
	(cdr seg))

(define (mid-point seg)
	(make-point (average (x-point (start-segment seg)) (x-point (end-segment seg)))
	(average (y-point (start-segment seg)) (y-point (end-segment seg)))) )

(define (display-point p)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")"))

(define (display-segment seg)
	(newline)
	(display-point (start-segment seg))
	(display " - ")
	(display-point (end-segment seg)))

(display-segment (make-segment (make-point 0 0) (make-point 2 3)))


(display-point (mid-point (make-segment (make-point 0 0) (make-point 2 3))))