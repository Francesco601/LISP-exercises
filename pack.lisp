;;pack consecutive duplicates of list elements into sublists

(defun pack (list)
	(if (eql list nil) 
		nil
		(cons (glue list) (pack (strip list)))
	)
)

(defun glue (list)
    (cond ((eql list nil) nil)
	  ((eql (cdr list) nil) list)
          ((equal (car list) (cadr list))
              (cons (car list) (glue (cdr list))))
          (t (list (car list)))
    ) )


(defun strip (list)
    (cond ((eql list nil) nil)
	  ((eql (cdr list) nil) nil)
          ((equal (car list) (cadr list))
              (strip (cdr list)))
          (t (cdr list))
    )
)


