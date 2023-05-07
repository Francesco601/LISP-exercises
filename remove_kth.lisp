
;;remove the kth element from a list


;;recursive solution
(defun remove-at (list index)
  (cond
    ((< index 1) (error "Invalid index."))
    ((= index 1) (rest list))
     (t (cons (first list) (remove-at (rest list) (1- index))))))

;; iterative solution

(defun remove-at2 (list index)
  (cond
    ((< index 1) (error "Invalid index."))
    (t  (loop
	      :for rest :on list
	      :repeat (1- index)
	      :collect (first rest) :into left
	      :finally (return (nconc left (rest rest)))))))

