
;; Write a version of the LISP function intersection
;; that computes the set intersection of two lists.
;; Ignore the order of elements and assume there are
;; no repeats.

(defun intersect (l1 l2 &aux res)
  (dolist (a ls1 (nreverse res))
    (dolist (b ls2)
      (when (equal a b)
	(push a res)))))


	
		
