(define (square-tree-direct tree)
  (define (square n) (* n n))
  (cond ((null? tree) tree)
        ((not (pair? tree)) (square tree))
        (else
          (cons (square-tree-direct (car tree))
                (square-tree-direct (cdr tree))))))