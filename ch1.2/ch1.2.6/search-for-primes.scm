(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (square n) (* n n))
  (define (next n) (if (= n 2) 3 (+ n 2)))
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))
  
(define (prime? n)
  (= n (smallest-divisor n)))
  
(define (search-for-primes start end)
  (define (next-odd n) (if (even? n) (+ n 1) (+ n 2)))
  (define (search-iter start end a)
    (if (> start end)
        (reverse a)
        (let ((next-start (next-odd start)))
          (if (prime? start)
              (search-iter next-start end (cons start a))
              (search-iter next-start end a)))))
  (search-iter start end ()))
        
  