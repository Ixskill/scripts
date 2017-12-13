
;;v1
(defun my-make()
  (let ((makefile-dir (locate-dominating-file "." "makefile")))
	(if makefile-dir
		(progn
		  (print (format "found makefile in %s" makefile-dir))
		  (call-interactively (compile (format "make -c %s" makefile-dir))))
	  (print "makefile not found"))))

;; V2
(defun my-make()
  (let ((makefile-dir (locate-dominating-file "." "makefile"))))
	(if makefile-dir
		(progn
		  (print (format "found makefile in %s" makefile-dir))
		  (call-interactively (compile (read-string
										"Insert make options: " (format "make -f -C %s "))))
	  (print "makefile not found"))))
