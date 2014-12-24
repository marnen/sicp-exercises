(define (perimeter-rect rectangle)
  (* (+ (height-rect rectangle) (width-rect rectangle)) 2))
  
(define (area-rect rectangle)
  (* (height-rect rectangle) (width-rect rectangle)))