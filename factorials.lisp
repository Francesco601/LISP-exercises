
;; recursive factorial function
(defun factorial1 (n)
  (if (= n 1)
      1
      (* n (factorial1 (- n 1)))))

;; iterative with prog

(defun factorial2 (n)
  (prog ((p 1)(i 1))
   again
     (setf p (* p i))
     (setf i (+ i 1))

     (if (> i n) (return p))
     (go again)))

;;iterative with do

(defun factorial3 (n)
   (let ((R 1)
     (do ((i 1 (+ i 1))) ((> i n) R)

     (setf r (* r i))))))  
	
	   
