(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson-integral f a b n)
  (let ((h (/ (- b a) n)))
    (define (simpson-term k)
      (let ((multiplier
              (cond ((= 0 k) 1)
                    ((= n k) 1)
                    ((even? k) 2)
                    ((odd? k) 4))))
      (* multiplier (f (+ a (* k h))))))
    (* (/ h 3) (sum simpson-term 0 1+ n))))