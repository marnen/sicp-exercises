(define (fringe items)
  (cond ((null? items) ())
        ((not (pair? items)) (list items))
        (else
         (append (fringe (car items)) (fringe (cdr items))))))