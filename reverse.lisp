;;reverse list

(defun invert (list)
  (invert-aux list () )
  )

(defun invert-aux (list rest)
  (if (null list)
      rest
    (invert-aux (rest list) (cons (car list) rest) )
    )
  )

