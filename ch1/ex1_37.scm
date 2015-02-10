;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;;   Excersise 1.37
;;;;

;;;; a)  Recursive

(define (cont-frac N D k)
	(define (cont-frac-iter i)
		(if (= i k)
			0
			(/ (N i) (+ (D i) (cont-frac-iter (+ i 1))))))
	(cont-frac-iter 0))


;;;;;; b)  Iterative


(define (cont-frac N D k)
	(define (cont-frac-iter i res)
		(if (= i 0) res
			(cont-frac-iter (- i 1) (/ (N i) (+ (D i) res)))))
	(cont-frac-iter k 0))




;;;;;;;;;;

(define k 2)

(cont-frac (lambda (i) 1.0)
	(lambda (i) 1.0)
	k)