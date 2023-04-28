;; return last element of list


(defun my_last (ls)
  (if (null ls)
      nil
    (if (null (cdr ls))
	list			 
      (my_last(cdr ls)	
      )
    )
  ) )
