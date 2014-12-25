(define (square n) (* n n))

(define (square-tree-direct tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (square tree))
        (else
          (cons (square-tree-direct (car tree))
                (square-tree-direct (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree-map subtree)
             (square subtree)))
       tree))
