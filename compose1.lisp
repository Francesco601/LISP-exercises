
;; write a version of compose that allows any number
;; of arguments, not just two

(defun compose (&rest functions)
  "Return the function that is the composition of all the args"
  #'(lambda (x)
      (reduce #'funcall functions :from-end t :initial-value x)))



