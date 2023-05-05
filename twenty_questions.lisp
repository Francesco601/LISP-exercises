

;; write a program that will play the role
;; of guesser in the game Twenty Questions

(defstruct node
  name
  (yes nil)
  (no nil))

(defvar *db*
  (make-node :name 'animal
	     : yes (make-node :name 'mammal)
	     : no (make-node
		   :name 'vegetable
		   : no (make-node :name 'mineral))))

(defun questions (&optional (node *db*))
  (format t "~&Is it a ~a? " (node-name node))
  (case (read)
    ((y yes) (if (not (null (node-yes node)))
		 (questions (node-yes node))
		 (setf (node-yes node) (give-up))))
    ((n no)  (if (not (null (node-no node)))
		 (questions (node-no node))
		 (setf (node-no node) (give-up))))
    (it 'aha!)
    (t (format t "Reply with YES, NO or IT if I have guessed it.")
       (questions node))

(defun give-up ()
  (format t "~&I give up. What is it? ")
  (make-node :name (read)))

