
(defun generate (phrase)
  "Generate a random sentence or phrase,
   differentiate between terminal and non-terminal symbols"
  (cond ((listp phrase)
	 (mappend #'generate phrase))
	((non-terminal-p phrase)
	 (generate (random-elt (rewrites phrase))))
	(t (list phrase))))

(defun non-terminal-p (category)
  "True if this is a category in the grammar"
  (not (null (rewrites category))))
