
;;check whether a given expression
;; represents a binary tree


(defun istree (tree)
  (if (null tree)
      t
    (and (listp tree)
	 (= 3 (length tree))
	 (istree (second tree))
	 (istree (third tree))
	 )
    )
  )
