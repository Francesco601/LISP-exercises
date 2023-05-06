
;; write a length function that uses reduce


(defun length-r (list)
  (reduce #'(lambda (x y) (+ x 1)) list
    	     :initial-value 0))

