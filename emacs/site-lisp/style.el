
;; Do not show the startup screen
(setq inhibit-startup-screen t)

;; Enables highlight mode
(global-font-lock-mode)
(global-hi-lock-mode)

;; Putting font
(set-face-attribute 'default nil :font "Roboto Mono Medium for Powerline 11")
(set-default-font "Roboto Mono Medium for Powerline-11")

(defun load-graphical-env (frame)
  (load-theme 'organic-green 'NO-CONFIRM)
  )

(defun load-term-env ()
	  (load-theme 'atom-dark 'NO-CONFIRM)
	  (setq atom-dark-theme-force-faces-for-mode nil)
	  )

(defun try-loading-graphical-env ()
  (if (display-graphic-p)
	  (progn
		(print "Sucessfully creating a graphical window")
		(load-graphical-env t))
	(progn
	  (print "Failed creating graphical window")
	(load-term-env))))

(add-hook 'after-make-frame-functions 'load-graphical-env)
(add-hook 'server-switch-hook 'try-loading-graphical-env)

;; Scroll settings
(setq scroll-margin 3
	  scroll-conservatively 10000
	  scroll-step 1)

;;; Not using with light themes
;; (add-hook 'after-init-hook (lambda ()
;;   (when (fboundp 'auto-dim-other-buffers-mode)
;;     (auto-dim-other-buffers-mode t))))
