(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
  
; derivation of (one) from this 
  
(add-1 zero)

(lambda (f)
  (lambda (x)
    (f (((lambda (f) (lambda (x) x)) f) x))))

(lambda (f) (lambda (x) (f ((lambda (x) x) x))))

(lambda (f) (lambda (x) (f x)))

(lambda (f) (lambda (x) (f x)))
