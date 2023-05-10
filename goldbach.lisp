
;;Goldbach's conjecture says that every positive even number greater
;; than 2 is the sum of two prime numbers. Example: 28 = 5 + 23. It
;; is one of the most famous facts in number theory that has not been
;; proved to be correct in the general case. It has been numerically
;; confirmed up to very large numbers (much larger than we can go
;;with our Prolog system). Write a predicate to find the two prime
;; numbers that sum up to a given even integer.


(defun goldbach (n)
  (check-type n (integer 4))
  (assert (evenp n))
  (let ((primes (compute-primes-to n))
        (bits   (make-array (1+ n) :element-type 'bit :initial-element 0)))
    (loop
       :for p :across primes :do (setf (aref bits p) 1))
    (loop
       :for p :across primes
       :when (plusp (aref bits (- n p)))
       :do   (return (list p (- n p)))
       :finally (return '()))))


(defun compute-primes-to (n)
  (cond
    ((< n 2) #())
    ((= n 2) #(2))
    ((= n 3) #(2 3))
    (t
     (let (bits-max bits bit (prime-count 2) (cur-prime 3) primes)
       ;; (SETF N (+ N (IF (ODDP N) 3 2)))
       (setf n (- n (if (oddp n) 3 2))) ; base of bits array is 3.
       (setf bits-max (/ n 2))
       ;; set the bitset to full bits;
       (setf bits (make-array (list bits-max) :initial-element 1 :element-type 'bit))
       (loop :while (< cur-prime n) :do
         (setf bit (+ cur-prime (/ (- cur-prime 3) 2)))
         (loop :while (< bit bits-max) :do
           (setf (aref bits bit) 0)
           (incf bit cur-prime))
         (setf bit (1+ (/ (- cur-prime 3) 2)))
         ;; search next prime
         (setf bit (position 1 bits :start bit))
         (if bit
             (setf cur-prime (+ bit bit 3)
                   prime-count (1+ prime-count))
             (setf cur-prime n)))
       ;; gather the primes.
       (setf primes (make-array (list prime-count) :element-type 'integer))
       (let ((curnum 0))
         (setf (aref primes curnum) 2)
         (incf curnum)
         (setf (aref primes curnum) 3)
         (incf curnum)
         (setf cur-prime 3)
         (setf bit 0)
         (setf bit (position 1 bits :start (1+ bit)))
         (loop :while bit :do
           (setf cur-prime (+ bit bit 3))
           (setf (aref primes curnum) cur-prime)
           (incf curnum)
           (setf bit (position 1 bits :start (1+ bit)))))
       primes))))
