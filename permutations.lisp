
(defun permutations (bag)
  "Return a list of all permutations of te input list"
  (if (null bag)
      '(())
      (mapcan #'(lambda (e)
	 (mapcar #'(lambda (p) (cons e p))
		 (permutations
		  (remove e bag :count 1 :test #'eq))))
	      bag)))


