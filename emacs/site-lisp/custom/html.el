(add-hook 'html-mode-hook
		  (lambda () (add-to-list 'sgml-tag-alist
					   '("div" ("class" ("row") ("col"))))))
