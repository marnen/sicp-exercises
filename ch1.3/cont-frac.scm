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