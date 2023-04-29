
;; remove a given  element throughout list

(defun rematom (e list)
  (cond
    ((null list) nil)
    ((eq e (car list)) (rematom e (cdr list)))
     (t (cons (car list) (rematom e (cdr list))))))

