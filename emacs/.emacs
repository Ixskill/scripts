(if (string= (shell-command-to-string "printf %s $(uname -s)") "Darwin")
	(setq config_files "/usr/share/emacs/site-lisp/")
  (setq config_files (concat (getenv "DOTFILES") "/emacs/site-lisp/"))
  )

;; Sourcing packages necessary for 42 header
(setq load-path (append (list nil config_files) load-path))
(load "list.el")
(load "string.el")
(load "comments.el")
(load "header.el")
;; A few default settings, just to make sure everything works alright
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(global-set-key (kbd "DEL") 'backward-delete-char)
(setq-default c-backspace-function 'backward-delete-char)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
								64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

;; Activates lines numbers
(global-linum-mode)

;; Enables highlight mode
(global-font-lock-mode)
(global-hi-lock-mode)

;; Every file is sent to this backup directory
(setq backup-directory-alist
	  `((".*" . "~/.emacs.d")))

;; Sourcing my modes a d packages init
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

;; Load evil-mode
(require 'evil)
(require 'powerline-evil)
(evil-mode t)

;; Remaps C-c as the ESC key. Useful for EVIL, bad for EMACS i guess. 
(define-minor-mode custom-vim-mode
				   "Learning"
  :keymap (make-sparse-keymap)
  :global)
(add-hook 'program-mode-hook #'custom-vim-mode)
(evil-define-key 'insert custom-vim-mode (kbd "jk") 'evil-force-normal-state)
(evil-define-key 'visual custom-vim-mode (kbd "C-c") 'evil-force-normal-state)
;*******************************************************************************;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(package-selected-packages (quote (magit evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
