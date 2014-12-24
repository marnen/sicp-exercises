(define (make-segment start end)
  (cons start end))
  
(define (start-segment segment)
  (car segment))
  
(define (end-segment segment)
  (cdr segment))
  
(define (print-segment segment)
  (display "[")
  (print-point (start-segment segment))
  (display ", ")
  (print-point (end-segment segment))
  (display "]"))

(define (make-point x y)
  (cons x y))
  
(define (x-point p)
  (car p))
  
(define (y-point p)
  (cdr p))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))
  
(define (midpoint-segment segment)
  (define (average x y) (/ (+ x y) 2))
  (let ((start (start-segment segment))
        (end (end-segment segment)))
    (make-point
      (average (x-point start) (x-point end))
      (average (y-point start) (y-point end)))))