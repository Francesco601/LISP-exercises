
;;Calculate Euler's totient function phi(m).
;; phi(m) is defined as the number of positive
;; integers r  1 <= r <= m) that are coprime to m. 


(defun my-gcd (p q)
  (cond
    ((= p q) p)
    ((< p q) (my-gcd p (- q p)))
    (t (my-gcd q (- p q)))))

(defun coprime (a b)
  (= 1 (my-gcd a b)))

(defun totient (m)
  (loop
	:for r :from 1 :below m
	:when (coprime r m)
	:count 1))









