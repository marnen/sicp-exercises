(define (for-each f items)
  (define (next items)
    (f (car items))
    (for-each f (cdr items)))
  (if (null? items)
    #t
    (next items)))