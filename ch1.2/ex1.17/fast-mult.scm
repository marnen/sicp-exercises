(define (fast-mult x y)
  (define (double n) (* n 2))
  (define (halve n) (/ n 2))
  (define (fast-mult-iter x y a)
    (cond
      ((= y 0) a)
      ((even? y) (fast-mult-iter (double x) (halve y) a))
      (else (fast-mult-iter x (- y 1) (+ a x)))))
  (fast-mult-iter x y 0))