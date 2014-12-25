(define (deep-reverse items)
  (if (pair? items)
    (append (deep-reverse (cdr items)) (list (deep-reverse (car items))))
    items))