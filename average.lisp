;;find the average of two numbers

(defun average (x y)
  (cond ((and (numberp x) (numberp y)) (/ (+ x y) 2))))
