
(defun bubble-sort (x)
  (let ((l (length x)))
    (dotimes (n l)
      (let ((swapped nil))
	(dotimes (m (- l 1))
	  (let ((num1 (nth m x))     ; get number at current index
		(num2 (nth (+ m 1) x))) ; get number at current index +1
	    (if (> num1 num2)      ; if current number is larger than next,swap
		(let ((temp num1))
		  (setf (nth m x) num2)
		  (setf (nth (+ m 1) x) temp)
		  (setf swapped t)))))
	(when (not swapped)
	  (return x))))))
