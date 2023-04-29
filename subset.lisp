
(defun subset (func ls)
  (cond
    ((null ls) res))
    (funcall func (car ls)) (cons (car  ls) res)
    (t (subset (func (cdr ls)))))
