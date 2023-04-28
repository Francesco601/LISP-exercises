
;; write a version of power of two using a do loop

(defun power-of-two (n)
  (do ((i 0 (1+ i))
       (sum 1 (* sum 2)))
      ((= i n) sum)))
