(define (power n exp)
  (if (zero? exp)
    1
    (* n (power n (- exp 1)))))

(define (cons a b)
  (* (power 2 a) (power 3 b)))
  
(define (factor-power n factor)
  (if (zero? (mod n factor))
    (+ 1 (factor-power (/ n factor) factor))
    0))
  
(define (car pair)
  (factor-power pair 2))
    
(define (cdr pair)
  (factor-power pair 3))