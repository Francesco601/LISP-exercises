
(defun generate (phrase)
  "Generate random sentence or phrase"
  (let ((choices nil))
       (cond ((lisp phrase)
	      (mappend #'generate phrase))
	     ((setf choices (rewrites phrase))
	      (generate (random-elt choices)))
	     (t list phrase))))
