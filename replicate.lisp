
;;replicate the elements of a list a given number of times
 
(defun repli (list int &optional (ini int))
    (cond ((eql list nil) nil)
          ((<= int 0) (repli (cdr list) ini ini))
          (t (cons (car list) (repli list (1- int) ini )))
    )
 )



