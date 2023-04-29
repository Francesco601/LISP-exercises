
;; write a version of the function make-assoc-list
;; using mapping functions.

(defun make-assoc-list (ls1 ls2)
  (mapcar 'list ls1 ls2))

