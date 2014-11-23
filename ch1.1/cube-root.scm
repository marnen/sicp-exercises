(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess old-guess)
  (and
    old-guess
    (< (/ (abs (- guess old-guess)) guess) 0.001)))

(define (square x)
  (* x x))
  
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cbrt-iter guess x old-guess)
  (if (good-enough? guess old-guess)
      guess
      (cbrt-iter (improve guess x) x guess)))
      
(define (cbrt x)
  (cbrt-iter 1.0 x nil))