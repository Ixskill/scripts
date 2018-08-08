(defun projectile-create-tags ()
  "Create tag file for the current projectile project"
  (interactive)
    (async-shell-command
     (format "%s -f %s -e -R %s" "ctags" (concat (projectile-project-root) "TAGS") (projectile-project-root)))
  )

(setq tags-add-tables nil)
(define-prefix-command 'tag-map)
(define-prefix-command 'other-window-tag-map)

(global-set-key (kbd "g") tag-map)
(define-key tag-map (kbd "o") 'other-window-tag-map)

(define-key tag-map (kbd "C-]") 'xref-find-definitions)
(define-key other-window-tag-map (kbd "C-]") 'xref-find-definitions-other-window)

(provide 'tags)
