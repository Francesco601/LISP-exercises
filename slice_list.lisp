
;; Given two indices, I and K, the slice is the list
;; containing the elements bewteen the Ith and Kth element
;; of the original list (both limits included).


(defun slice2 (list start last)
  (loop
	:repeat (1- start)
	:for rest :on list
	:finally (return (loop
			       :repeat (- last start -1)
			       :for item :in rest
			       :collect item))))


