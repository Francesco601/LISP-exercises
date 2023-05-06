
;; write a more efficient version of compose

(defun compose (&rest functions)
  "Return the function that is the composition of all the args"
  (case (length functions)
    (0 #'identity)
    (1 (first functions))
    (2 (let ((f (first functions))
	     (g (second functions))
             #'(lambda (x) (funcall f (funcall g x)))))
       (t #'(lambda (x)
	      (reduce #'funcall functions :from-end t
		      :initial-value x))))))
	     
