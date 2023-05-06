
;;write an efficient sort function that does not use append, etc..

(defun sorter (cost-fn)
  #'(lambda (new old)
      (merge 'list (sort new #'> :key cost-fn)
	     old #'> :key cost-fn)))


