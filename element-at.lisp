
;;find element at a a given location in list

(defun element-at (list n)
(if (= n 1)
    (car list)
    (element-at(cdr list) (1- n))))


