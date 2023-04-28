;; find number of elements in a list

(defun num_elements (list)
  (if (null list)
      0
    (1+ (num_elements (rest list)))))
