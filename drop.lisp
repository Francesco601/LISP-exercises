
;; drop every Nth element from a list

(defun drop (list n)
  (do ((l list (cdr l))
       (i 1 (1+ i))
       (result nil))
      ((null l) (nreverse result))
    (unless (= (mod i n) 0)
     (push (car l) result))))

