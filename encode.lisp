;; Run-length encoding of a list. Consecutive duplicates of elements
;; are encoded as lists (N E) where N is the number of duplicates
;; of element E.

(defun encode (l &optional (n 1))
  (cond
   ((null l)    nil)
   ((null (cdr l))   (list (list (car l) n)))
   ((eql (car l) (cadr l))   (encode (cdr l) (1+ n)))
   (t   (cons (list (car l) n) (encode (cdr l) 1)))))


