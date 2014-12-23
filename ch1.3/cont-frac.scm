(define (cont-frac numerator denominator count)
  (if (= count 0)
      0
      (/ (numerator count)
         (+ (denominator count) (cont-frac numerator denominator (- count 1))))))