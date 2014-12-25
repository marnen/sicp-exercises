(define (same-parity test . numbers)
  (define (same-parity-iter test numbers a)
    (if (null? numbers)
      a
      (let ((first (car numbers))
            (others (cdr numbers)))
        (if (even? (+ test first))
          (same-parity-iter test others (append a (list first)))
          (same-parity-iter test others a)))))
  (cons test (same-parity-iter test numbers ())))