(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (sub-interval x y)
  (add-interval x
                (make-interval
                 (- (lower-bound y))
                 (- (upper-bound y)))))

(define (mul-interval x y)
  (define (sign-interval interval)
    (cond ((not (negative? (lower-bound interval))) 1)
          ((negative? (upper-bound interval)) -1)
          (else 0)))

  (let ((x1 (lower-bound x))
        (x2 (upper-bound x))
        (y1 (lower-bound y))
        (y2 (upper-bound y))
        (sign-x (sign-interval x))
        (sign-y (sign-interval y)))

             ; (+x1 +x2) * (+y1 +y2)
             ; x1y1 < (x1y2, x2y1) < x2y2
             ; (+x1 +x2) * (-y1 -y2)
             ; x2y1 < (x1y1, x2y2) < x1y2
             ; (+x1 +x2) * (-y1 +y2)
             ; x2y1 < x1y1 < x1y2 < x2y2

       (cond ((= sign-x 1)
              (cond ((= sign-y 1)
                     (make-interval
                      (* x1 y1) (* x2 y2)))
                    ((= sign-y -1)
                     (make-interval
                      (* x2 y1) (* x1 y2)))
                    (else
                     (make-interval
                      (* x2 y1) (* x2 y2)))))

             ; (-x1 -x2) * (+y1 +y2)
             ; x1y2 < (x1y1, x2y2) < x2y1
             ; (-x1 -x2) * (-y1 -y2)
             ; x2y2 < (x1y2, x2y1) < x1y1
             ; (-x1 -x2) * (-y1 +y2)
             ; x1y2 < x2y2 < x2y1 < x1y1

             ((= sign-x -1)
              (cond ((= sign-y 1)
                     (make-interval
                      (* x1 y2) (* x2 y1)))
                    ((= sign-y -1)
                     (make-interval
                      (* x2 y2) (* x1 y1)))
                    (else
                     (make-interval
                      (* x1 y2) (x1 * y1)))))

             ; (-x1 +x2) * (+y1 +y2)
             ; x1y2 < x1y1 < x2y1 < x2y2
             ; (-x1 +x2) * (-y1 -y2)
             ; x2y1 < x2y2 < x1y2 < x1y1
             ; (-x1 +x2) * (-y1 +y2)
             ; (x1y2, x2y1) < (x1y1, x2y2)

             (else
              (cond ((= sign-y 1)
                     (make-interval
                      (* x1 y2) (* x2 y2)))
                    ((= sign-y -1)
                     (make-interval
                      (* x2 y1) (* x1 y1)))
                    (else
                     (make-interval
                      (min (* x1 y2) (* x2 y1))
                      (max (* x1 y1) (* x2 y2)))))))))

(define (div-interval x y)
  (define (sign n)
    (cond ((positive? n) 1)
          ((negative? n) -1)
          (else 0)))
  (define (spans-zero? interval)
    (negative?
     (* (sign (lower-bound interval))
        (sign (upper-bound interval)))))
  (if (spans-zero? y)
    (error "Denominator interval can't span 0")
    (mul-interval x
                  (make-interval
                   (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y))))))