
;;given a run-length encoded list, construct its
;; unncompressed version


(defun decode-modified (code)
  (if (null code)  nil
    (append (decode-one (car code))
	    (decode-modified (cdr code)))
    )
  )

(defun decode-one (one-code)
    (if (listp one-code)
	(repeat (first one-code) (second one-code))
      (list one-code)
    )
)

(defun repeat (n expr)
    (if (zerop n)
	nil
      (cons expr (repeat (1- n) expr))
    )
)
