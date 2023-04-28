
;; write a LISP function that checks to see two
;; numbers are sufficiently close to one another
;; to count as identical for some purpose. *tolerance* is
;; a free symbol.


(defun close_enough (x y)
  (setq *tolerance* '2.4)
  (setq z (abs (- x y)))
  (if (or (< z *tolerance*) (= z *tolerance*)) t))
