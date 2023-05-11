

;;;The following common lisp program is based on a solution given by
;;;Winston and Horn ("Lisp 3rd edition",1989, p.289, 538-539.)
;;;Significant improvements and alterations were made in all but the most
;;;primitive functions.  To run, simply load file and type (queen n) where
;;;n is the width of board.

;discovers if a piece threatens another
(defun threat (i j a b)
  (or (= i a)
      (= j b)
      (= (- i j) (- a b))
      (= (+ i j) (+ a b))))


;discovers if a placement is OK
(defun conflict (n m board)
  (cond  ((endp board) nil)
         ((threat n
                  m
                  (first (first board))
                  (second (first board)))
          t)
         (t (conflict n m (rest board)))))


;;this now prints a board no matter what order it is presented in
(defun print-board (board)
;  (sort board #'<= :key #'car)
  (format t "~%*")
  (print-horizontal-border board)
  (format t "*")
  (dotimes (row (length board))
    (format t "~%|")
    (dotimes (column (length board))
      (if (= column (second (assoc row board)))
          
        (format t " Q")
        (format t " .")))
    (format t " |"))
  (format t "~%*")
  (print-horizontal-border board)
  (format t "*"))


(defun print-horizontal-border (board)
  (dotimes (n (+ 1 (* 2 (length board))))
    (format t "-")))




;;;The following is Winston/Horn's original queen-finding algorithm.
;;;It does not discriminate sets of solutions that are closed under rotation
;;;and reflection.  Thus, a single solution can be equivalent to up to 8 other
;;;solutions.  

(defun queen* (size &optional (board nil) (n 0) (m 0))
  (unless (= m size)
    ;;Check for conflict in current row and column
    (unless (conflict n m board)
      (if (= (+ 1 n) size)
        ;;If all queens placed, prin solution:
        (print-board (reverse (cons (list n m) board)))
        ;;Otherwise, proceed to next row:
        (queen* size (cons (list n m) board) (+ 1 n) 0)))
    ;;In any case, try with another column
    (queen* size board n (+ 1 m))))


;;;  This version improves on Winston/Horn in that it displays only one instance
;;;of a closed set of solutions.  Thus, 8-queens solution is reduced from 96 to 12.
;;;It achieves this by using a bindings list of already-found solutions.  Since a change 
;;;made at a deeper level of recursive search must be accessible to a higher level,
;;;the bindings list was made a global parameter that is re-initialized when queen is called.
;;;  This required an auxilliary function, thus labels. 
;;;NO-REPEATS predicate returns t if no member of the set of solutions, closed under reflection
;;;and rotation, is on the bindings list.
;;;Finally, the local variable new-board was assigned to save re-calculating that data.


(defun queen (size)
  ;;initialize bindings variable
  (defparameter *bindings* nil)
  ;;declare auxilliary function
  (labels ((n-queen (size &optional (board nil) (n 0) (m 0))
             (unless (= m size)
               (let ((new-board (cons (list n m) board)))
                 (unless (conflict n m board)
                   (if (= (+ 1 n) size)
                     ;;check to see if solution is repeated
                     (if (no-repeats new-board (- size 1))
                       (progn                        ;only print solution if not already printed
                         (print-board new-board)
                         (setf *bindings* (append (list (sort-board new-board))
                                                  *bindings*))))           ;change bindings
                     (n-queen size (cons (list n m) board) (+ 1 n) 0))))
                 (n-queen size board n (+ 1 m)))))
    ;;call auxilliary function:
          (n-queen size nil 0 0)))






(defun no-repeats (board size)
"looks to see if a permutation of current board has already been found--assumes a properly sorted bindings list"


;(format t "~&Bindings are:   ~a" *bindings*)
;(format t "~&Equiv. Class is:  ~a" (make-set board size))

(if (equal *bindings* nil)     ;check to see if bindings in nil---find has a problem with this
  t
  (labels ((find-double (-eq-class-)
   
             (if (equal nil -eq-class-)
               t 
               (and (not (find (first -eq-class-) *bindings* :test #'equal))  ;find solution in bindings
                    (find-double (rest -eq-class-))))))
    (find-double (make-set board size)))))






(defun reflect-horizontal (board size &optional (new-board nil))
"reflects across horizontal axis"

  (if (equal board nil)
    new-board
    (reflect-horizontal (rest board) size (cons  (list (- size (first (first board))) 
                                                       (second (first board)))
                                                 new-board))))
  
(defun rotate-90 (board size &optional (new-board nil))
"reflects across diagonal axis"
  (if (equal board nil)
    (sort-board new-board)
    (rotate-90 (rest board) size (cons  (list (second (first board))
                                              (- size (first (first board))))
                                        new-board))))
  

(defun make-set (board size)
  (let*((board1 (sort-board board))
        (board2 (rotate-90 board1 size))
        (board3 (rotate-90 board2 size))
        (board4 (rotate-90 board3 size))
        (board5 (reflect-horizontal board1 size))
        (board6 (rotate-90 board5 size))
        (board7 (rotate-90 board6 size))
        (board8 (rotate-90 board7 size)))

    (list board1
          board2
          board3
          board4
          board5
          board6
          board7
          board8)))
       
   

(defun sort-board (board &optional (counter 0))
  "sorts a board configuration into ascending order by rows"
  (if (= counter (length board))
    nil
    (cons (assoc counter board)
          (sort-board board (+ counter 1)))))
    

