
(defun dot-product (a b)
  "Compute the mathematical dot product of two vectors"
  (if (or (null a) (null b))
      0
      (+ (* (first a) (first b))
	 (dot-product (rest a) (rest b)))))
















