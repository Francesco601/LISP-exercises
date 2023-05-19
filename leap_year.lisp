(defun divisible-by-p (divisor n)
  "Check that n is divisible by the divisor"
  (zerop (mod n divisor)))
(defun leap-year-p (year)
  "Naively check whether the given year is a leap year."
  (and (divisible-by-p 4 year)
       (or (divisible-by-p 400 year)
           (not (divisible-by-p 100 year)))))
