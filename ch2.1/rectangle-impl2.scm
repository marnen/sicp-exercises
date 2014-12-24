(define (make-rect top bottom left right)
  (cons (cons top bottom) (cons left right)))
  
(define (diff x y)
  (abs (- x y)))
  
(define (vertical-rect rectangle)
  (car rectangle))
  
(define (horizontal-rect rectangle)
  (cdr rectangle))
  
(define (top-rect rectangle)
  (car (vertical-rect rectangle)))
  
(define (bottom-rect rectangle)
  (cdr (vertical-rect rectangle)))
  
(define (left-rect rectangle)
  (car (horizontal-rect rectangle)))
  
(define (right-rect rectangle)
  (cdr (horizontal-rect rectangle)))
  
(define (height-rect rectangle)
  (diff (top-rect rectangle) (bottom-rect rectangle)))

(define (width-rect rectangle)
  (diff (left-rect rectangle) (right-rect rectangle)))

(load "rectangle")