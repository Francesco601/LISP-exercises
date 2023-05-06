
;; write a version of tree-search using an explicit
;; loop rather than recursion

(defun tree-search (states goal-p sucessors combiner)
  "Find a state that satsifies goal-p. Start with states and
  search according to successors and conmbiner,"
  (loop
	(cond ((null states) (return fail))
	      ((funcall goal-p (first states))
	       (return (first states))
	       (t (setf states
			(funcall combiner
				 (funcall successors (first states))
				 (rest states(ì)))))))))
