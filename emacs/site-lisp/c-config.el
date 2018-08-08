;; Setting up c comment with 42 style
(setq c-block-comment-prefix "** ")

;; Compile options
(setq compilation-scroll-output 1)


(defun my-make()
  (interactive)
  (let ((makefile-dir (locate-dominating-file "." "makefile")))
	(if makefile-dir
		(progn
		  (print (format "Found Makefile in %s" makefile-dir))
		  (compile (read-string
					"Insert make options: " (format "make -C %s " makefile-dir))))
	  (print "Makefile not found"))))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))


(provide 'c-config)
