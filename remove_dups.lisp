;;eliminate consecutive duplicates from a list


(defun remove_dups (list)
  (cond
   ((null list) nil)
   ((null (cdr list)) list)
    ((eql (car list) (car (cdr list)))
     (remove_dups (cdr list)))
   (t (cons (car list) (remove_dups (cdr list))))
   )
  )

