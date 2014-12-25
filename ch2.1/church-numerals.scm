(define zero (lambda (f) (lambda (x) x)))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
  
(define (add-church m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

; expand add-church to make sure it works

; (add-church one two)

; (lambda (f) (lambda (x) ((one f) ((two f) x))))

; (lambda (f)
;   (lambda (x)
;     ((one f)
;     (((lambda (f) (lambda (x) (f (f x)))) f) x))))
     
; (lambda (f)
;   (lambda (x)
;     ((one f)
;     ((lambda (x) (f (f x))) x))))

; (lambda (f) (lambda (x) ((one f) (f (f x)))))

; (lambda (f)
;   (lambda (x)
;     (((lambda (f) (lambda (x) (f x))) f) (f (f x)))))
    
; (lambda (f)
;   (lambda (x) ((lambda (x) (f x)) (f (f x)))))

; (lambda (f) (lambda (x) (f (f (f x)))))
