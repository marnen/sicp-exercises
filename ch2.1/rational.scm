(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
          
(define (numer r) (car r))
(define (denom r) (cdr r))
      
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))
     
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (define (sign x)
    (cond ((negative? x) -1)
          ((positive? x) 1)
          (else 0)))
  (let ((g (gcd n d))
        (whole-sign (* (sign n) (sign d))))
    (cons (* whole-sign (abs (/ n g)))
          (abs (/ d g)))))
