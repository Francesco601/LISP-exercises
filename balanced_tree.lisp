
;; returns a list with all
;; completely balanced binary trees
;; with a given number of nodes

(defun cbal-tree (n)
  (cond
   ((= n 0) (list ()))
   ((oddp n)
    (append (cart-process (cbal-tree (/ (1- n) 2))
			  (cbal-tree (/ (1- n) 2))
			  )
	    ))
   ((evenp n)
    (append (cart-process (cbal-tree (/ (- n 2) 2))
			  (cbal-tree (/ n 2))
			  )
	    (cart-process (cbal-tree (/ n 2))
			  (cbal-tree (/ (- n 2) 2))
			  )
	    ))
   )
  )

(defun cart-process (l1 l2)
  (process (cart-product l1 l2))
  )

(defun process (lista)
  (mapcar #'(lambda (x) (cons 'x x)) lista)
  )

(defun cart-product (l1 l2)
  (let ((a nil))
    (dolist (t1 l1 a)
      (setf a (append (mapcar #'(lambda (x) (list t1 x)) l2) a))
      )
    )
  )
