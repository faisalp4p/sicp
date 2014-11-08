(define (square x) (* x x))

(define (sum-of-squares a b) (+ (square a) (square b)))

(define (fun n1 n2 n3) 
  (if (< n1 n2) 
      (if (< n1 n3)
	  (sum-of-squares n2 n3)
	  (sum-of-squares n2 n1))
      (if (< n2 n3)
	  (sum-of-squares n1 n3)
	  (sum-of-squares n2 n1))))


(fun 3 2 5)