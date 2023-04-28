
;;write a function power of two using a prog loop

(defun power-of-two (n)
  (prog ((i 0) (sum 1))
   again
   (cond ((= i n) (return sum)))
     (setq i (1+ i))
     (setq sum (* sum 2))
     (go again)))
