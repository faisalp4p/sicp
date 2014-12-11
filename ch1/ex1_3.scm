;;;;;; SICP excersise 1.3


;;; procedure to calculate square
(define (square x) (* x x))


;;;  procedure to calculate sum of squares of two number

(define (sum-of-squares a b) (+ (square a) (square b)))


;;; procedure to calculate sum of squares of two large numbers in  given 3 numbers

(define (fun n1 n2 n3) 
  (if (< n1 n2) 
      (if (< n1 n3)
	  (sum-of-squares n2 n3)
	  (sum-of-squares n2 n1))
      (if (< n2 n3)
	  (sum-of-squares n1 n3)
	  (sum-of-squares n2 n1))))


;;;  calling fun
(fun 3 2 5)