(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess old-guess)
  (and
    old-guess
    (< (/ (abs (- guess old-guess)) guess) 0.001)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (sqrt-iter guess x old-guess)
  (if (good-enough? guess old-guess)
      guess
      (sqrt-iter (improve guess x) x guess)))
      
(define (my-sqrt x)
  (sqrt-iter 1.0 x nil))