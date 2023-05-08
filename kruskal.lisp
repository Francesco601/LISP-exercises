

;; Kruskal's algorithm in ANSI Common Lisp (CLisp)

(defun find-first (pred ls)
  (cond
    ((null ls) nil)
    ((funcall pred (car ls)) (car ls))
    (t (find-first pred (cdr ls)))))

(defun creates-cycle-p (path graph)
  (let ((e (find-first (lambda (x) (intersection  path x)) graph)))
    (cond
      ((null e) nil)
      ((every (lambda (x) (member x path)) e) t)
         (t (creates-cycle-p (union path e)
			    (remove e graph :test #'equal))))))

(defun kruskal (graph &optional tree)
  (if (null graph)
      tree
      (let ((e (elt graph (random (length graph)))))
	(kruskal (remove e graph :test #'equal)
		 (if (creates-cycle-p e tree)
		 tree
		 (cons e tree))))))




	  
