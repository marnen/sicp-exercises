(define zero (lambda (f) (lambda (x) x)))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; derive add-2

(add-1 (add-1 n))

(lambda (f)
  (lambda (x)
    (f (((lambda (f) (lambda (x) (f ((n f) x)))) f) x))))

(lambda (f) (lambda (x) (f (f ((n f) x)))))
