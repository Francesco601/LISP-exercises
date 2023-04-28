
(defun flatten (orig-list)
  (if (eql orig-list nil)
      nil
      (let ((elem (car orig-list) (rest-list (cdr orig-list)))
        (if (listp elem)
	    (append (flatten elem) (flatten rest-list))
	    (append (cons elem nil) (flatten rest-list)))))))

