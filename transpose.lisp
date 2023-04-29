
;;transpose a 2x2 matrix represented as a list of lists

(defun cars (matrix)
  "Return a list with all the cars of the lists in matrix"
  (if (null matrix)
      nil
      (cons (car (car matrix)) (cars (cdr matrix)))))

(defun cdrs (matrix)
  "Return a list with all the cdrs of the lists in matrix"
  (if (null matrix)
      nil
      (cons (cdr (car matrix)) (cdrs (cdr matrix)))))

(defun transpose (matrix)
  "Transpose matrix"
  (cond ((null matrix) nil)
        ((null (car matrix)) nil)
        (t (cons (cars matrix) (transpose (cdrs matrix))))))
