;; find next to last element of a list


(defun penultimate (list)
  (let ((l (reverse list))))
					
    (cond
     ((null l) nil)
    
     ((<= (length l) 2) list)
    
     (t (list (second l) (first l))
     )
    )
  )
)
