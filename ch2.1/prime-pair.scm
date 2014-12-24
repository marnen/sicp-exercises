(define (power n exp)
  (if (zero? exp)
    1
    (* n (power n (- exp 1)))))

(define (cons a b)
  (* (power 2 a) (power 3 b)))
  
(define (car pair)
  (if (zero? (mod pair 2))
    (+ 1 (car (/ pair 2)))
    0))
    
(define (cdr pair)
  (if (zero? (mod pair 3))
    (+ 1 (cdr (/ pair 3)))
    0))