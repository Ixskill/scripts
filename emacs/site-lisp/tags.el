(defun projectile-create-tags ()
  "Create tag file for the current projectile project"
  (interactive)
    (async-shell-command
     (format "%s -f %s -e -R %s" "ctags" (concat (projectile-project-root) "TAGS") (projectile-project-root)))
  )

(setq tags-add-tables nil)
(define-prefix-command 'tag-map)
(define-prefix-command 'other-window-tag-map)

(provide 'tags)
