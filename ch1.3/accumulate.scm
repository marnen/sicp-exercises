(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))
  
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))
  
(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a) (product-recursive term (next a) next b))))
  
(define (factorial n)
  (define (id n) n)
  (product id 1 1+ n))
  
(define (pi-approx n)
  (define (fraction n)
    (if (odd? n)
        (/ (+ n 1) (+ n 2))
        (/ (+ n 2) (+ n 1))))
  (* 4 (product fraction 1 1+ n)))