(define zero (lambda (f) (lambda (x) x)))

(define one (lambda (f) (lambda (x) (f x))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
  
; derivation of (two)

(add-1 one)

(lambda (f)
  (lambda (x)
    (f (((lambda (f) (lambda (x) (f x))) f) x))))

(lambda (f)
  (lambda (x) (f ((lambda (x) (f x)) x))))

(lambda (f) (lambda (x) (f (f x))))
