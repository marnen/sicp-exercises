(define (cont-frac numerator denominator count)
  (define (cont-frac-iter numerator denominator count a)
    (if (= count 0)
        a
        (cont-frac-iter
          numerator
          denominator
          (- count 1)
          (/ (numerator count)
             (+ (denominator count) a)))))
  (cont-frac-iter numerator denominator count 0))
  
(define (e iterations)
  (+ 2 (cont-frac (lambda (i) 1)
                  (lambda (i)
                    (if (= (mod i 3) 2)
                        (* 2 (ceiling (/ i 3)))
                        1))
                  iterations)))
                  
(define (tan-cf x iterations)
  (cont-frac (lambda (i)
               (if (= i 1) x (- (* x x))))
             (lambda (i)
               (- (* 2 i) 1))
             iterations))