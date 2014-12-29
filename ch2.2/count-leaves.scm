(load "accumulate")


(define (count-leaves items)
  (define (enumerate-tree tree)
    (cond ((null? tree) ())
          ((not (pair? tree)) (list tree))
          (else (append
                 (enumerate-tree (car tree))
                 (enumerate-tree (cdr tree))))))
  (accumulate
   +
   0
   (map (lambda (item) 1) (enumerate-tree items))))