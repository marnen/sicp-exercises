(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (square n) (* n n))
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (nex test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))
  
(define (prime? n)
  (= n (smallest-divisor n)))