
;; determine of element is present in a list
;; at least twice.

(defun multi-member (e l)
 (cond ((member e l) (member e (cdr (member e l))))))




