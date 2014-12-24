(define (compose f g)
  (lambda (x) (f (g x))))
  
(define (repeated f n)
  (if (= n 1)
    f
    (lambda (x) ((compose f (repeated f (- n 1))) x))))
    
(define (smooth f)
  (lambda (x)
    (let ((dx 0.00001))
      (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3))))