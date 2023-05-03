
;; determine the greatest common divisor
;; of two positive integer numbers (Euclid's algorithm)

(defun my-gcd (p q)
  (cond
    ((= p q) p)
    ((< p q) (my-gcd p (- q p)))
    (t       (my-gcd q (- p q)))))
