
;; write the function for set intersection
;; using mapping function and lambda

(defun intersect (l1 l2)
  (remove-if-not (lambda (x) (member x l2)) l1))
