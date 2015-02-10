(define (average x y) (/ (+ x y) 2.0))
(define (close-enough? x y)
	(< (abs (- x y)) 0.001))





(define (search f neg-point pos-point)
	(let (midpoint (average neg-point pos-point)))
	(if (close-enough? neg-point pos-point)
		midpoint
		(let (test-value (f midpoint)))
		(cond ((positive? test-value) (search f neg-point midpoint))
			((negative? test-value) (search f midpoint pos-point))
			(else midpoint))))


(search sin 2.0 4.0)