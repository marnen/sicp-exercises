(define (id n) n)

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))
  
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (product id 1 1+ n))
  
(define (pi-approx n)
  (define (fraction n)
    (if (odd? n)
        (/ (+ n 1) (+ n 2))
        (/ (+ n 2) (+ n 1))))
  (* 4 (product fraction 1 1+ n)))