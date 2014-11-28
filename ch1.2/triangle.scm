; row and position start from 1
(define (triangle row position)
  (let ((next-row (+ 1 row)))
       (if (> position (/ next-row 2))
           (triangle row (- next-row position))
           (if (= position 1)
               1
               (let ((prev-row (- row 1)))
                    (+ (triangle prev-row (- position 1))
                       (triangle prev-row position)))))))