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

; derive add-0

((lambda (n) (lambda (f) (lambda (x) ((n f) x)))) one)

(lambda (f) (lambda (x) ((one f) x)))

(lambda (f) (lambda (x) ((lambda (x) (f x)) x)))

(lambda (f) (lambda (x) (f x)))

; make general add-m (such that (add-m 1) = (add-1)
((lambda (m) (lambda (f) (lambda (x) ((m f) ((n f) x))))) one)

(lambda (f) (lambda (x) ((one f) ((n f) x))))

(lambda (f)
  (lambda (x)
    ((lambda (x) (f x)) ((n f) x))))

(lambda (f)
  (lambda (x)
    (f ((n f) x))))
