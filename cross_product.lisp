
(defun cross-product (fn xlist ylist)
  "Return a list of all (fn x y) values"
  (mappend #'(lambda (y)
	      (mapcar #'(lambda (x) (funcall fn x y))
		      xlist))
	  ylist))

(defun combine-all (xlist ylist)
  "Return a list of lists formed by appending a y to an x"
  (cross-product #'append xlist ylist))


	      
	      
