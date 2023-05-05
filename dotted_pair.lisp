
;;write a function that will print an expression
;;in dotted pair notation. Use princ to print
;;each component of the expression

(defun dprint (x)
  "Print an expression in dotted pair notation"
  (cond ((atom x) (princ x))
	(t (princ "(")
	   (dprint (first x))
	   (pr-rest (rest x))
	   (princ ")")
	   x)))

(defun pr-rest (x)
  (princ " . ")
  (dprint x))
