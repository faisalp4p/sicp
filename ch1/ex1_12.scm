(define (pascal n m) 
  (cond ((= m 0) 1)
	((= n m) 1)
	(else (+ (pascal (- n 1) (- m 1) ) (pascal (- n 1) m) )) ))

(pascal 5 3)