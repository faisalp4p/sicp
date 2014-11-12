
(define (f-iter a b c counter)
  (if (= counter 0) a
      (f-iter b c (+ c (* 2 b) (* 3 a) ) (- counter 1))))

(define (f n)
  (f-iter 0 1 2 n))

(f 6)