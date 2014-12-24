(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (try guess)
      (display guess)
      (newline)
      (if (good-enough? guess)
        guess
        (try (improve guess))))
    (try first-guess)))
