(load "segment")

(define (make-rect upper-left lower-right)
  (cons upper-left lower-right))
  
(define (upper-left-rect rectangle)
  (car rectangle))
  
(define (lower-right-rect rectangle)
  (cdr rectangle))
  
(define (diff x y)
  (abs (- x y)))
  
(define (height-rect rectangle)
  (diff (y-point (upper-left-rect rectangle))
        (y-point (lower-right-rect rectangle))))
        
(define (width-rect rectangle)
  (diff (x-point (upper-left-rect rectangle))
        (x-point (lower-right-rect rectangle))))

(load "rectangle")