(define (f n)
  (define (f-iter a b c n)
    (if (< n 3)
        a
        (f-iter
          (+ a (* 2 b) (* 3 c))
          a
          b
          (- n 1))))
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))