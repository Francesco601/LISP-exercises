
;; determine if a number is perfect (sum of divisors equal to number)
;; deficient (sum of divisors less than numer) or abundant
;; (sum of divisors greater than number


(defun factors (n)
  (loop
       for i from 1 below (ceiling (/ (1+ n) 2))
	when (zerop (mod n i))
	collect i))

(defun classify (n)
  (when (plusp n)
    (let ((aliquot (reduce #'+ (factors n))))
	(cond
	  ((< aliquot n) "deficient")
	  ((> aliquot n) "abundant")
	  (t "perfect")))))

