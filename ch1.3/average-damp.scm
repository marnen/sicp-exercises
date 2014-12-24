(define (average-damp f)
  (lambda (x)
    (/ (+ x (f x)) 2)))
    
(load "fixed-point")
(load "compose")

(define (power x y)
  (if (= y 0)
    1
    (* x (power x (- y 1)))))

(define (nth-root x n)
  (let ((damp-count (max (- n 2) 1)))
    (fixed-point
      ((repeated average-damp damp-count)
        (lambda (y) (/ x (power y (- n 1)))))
      1)))