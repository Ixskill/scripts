;; Conditionally loads the local site-lisp folder containing 42header ressources
(if (string= (shell-command-to-string "printf %s $(uname -s)") "Darwin")
	(setq config_files "/usr/share/emacs/site-lisp/")
  (setq config_files (concat (getenv "DOTFILES") "/emacs/site-lisp/")))

;; Sourcing packages necessary for 42 header
(setq load-path (append (list nil config_files) load-path))
(load "list.el") (load "string.el")
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
(add-hook 'prog-mode-hook (lambda() (linum-mode)))
(add-hook 'prog-mode-hook (lambda() (show-paren-mode)))

;; NEED MY FUCKING TABS
(add-hook 'prog-mode-hook (lambda() (local-set-key (kbd "TAB") 'self-insert-command)))

;; Enables highlight mode
(global-font-lock-mode)
(global-hi-lock-mode)

;; Every file is sent to this backup directory
(setq backup-directory-alist
	  `((".*" . "~/.emacs.d")))
(setq auto-save-file-name-transforms
	  `((".*" ,"~/.emacs.d" t)))

;; Sourcing my modes a d packages init
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)

;; Helm
(require 'helm-config)
;; Org mode
(require 'org-install)

;; Load evil-mode
(require 'evil)
(evil-mode 1)

(evil-select-search-module 'evil-search-module 'evil-search)

;; Powerline,powerline
(require 'powerline)
(powerline-center-evil-theme)

;; Remaps C-c as the ESC key. Useful for EVIL, bad for EMACS i guess. 
(evil-define-key 'insert 'evil-insert-state-map (kbd "C-c") 'evil-force-normal-state)
(evil-define-key 'visual 'evil-visual-state-map (kbd "C-c") 'evil-force-normal-state)
(evil-define-key 'replace 'evil-replace-state-map (kbd "C-c") 'evil-force-normal-state)

;; Disable toolbar mode
(if (display-graphic-p)
	(progn ((tool-bar-mode -1)
			(menu-bar-mode -1)
			(scroll-bar-mode -1)))
  ())

;; Loading theme depending on GUI or term
(if (display-graphic-p)
										; if part
										;(load-theme 'green-phosphor 'NO-CONFIRM)
	;; (load-theme 'nord 'NO-CONFIRM)
										;(load-theme 'deeper-blue 'NO-CONFIRM)
	(load-theme 'subatomic 'NO-CONFIRM)
										; else part
  (load-theme 'subatomic256 'NO-CONFIRM)
  ;; (load-theme 'nord 'NO-CONFIRM)
  )

;; Do not show the startup screen
(setq inhibit-startup-screen t)

;; Putting font
(set-default-font "Roboto Mono Medium for Powerline-11")

;; Scroll settings
(setq scroll-margin 3
	  scroll-conservatively 10000
	  scroll-step 1)

;; A few keymapings
										;(global-set-key (kbd "M-O") 'mode-line-other-buffer) ;; HUGE PROBLEM
(global-set-key (kbd "M-x") 'helm-M-x)

;;; Functions
;; Defining a few of my own functions

(defun surround-region-with-paren ()
  "Surrounds the active region with parentheses by killing the region, inserting parens and reinserting the region kill-ring inside"
  (interactive) 
  (progn
	(call-interactively 'kill-region)
	(insert "(")
	(insert (car kill-ring))
	(insert ")")))

(evil-define-key 'visual 'evil-visual-state-map (kbd "(") 'surround-region-with-paren)


;; Setting up c comment with 42 style
(setq c-block-comment-prefix "** ")

;; Setting up a hack for system clipboard in emacs
;;;; TODO

;; Compile options
(setq compilation-scroll-output 1)

;; Setting up clipboard copy and paste
(if (string= (shell-command-to-string "printf %s $(uname -s)") "Darwin")
	(defun paste-from-system-clipboard ()
	  (interactive)
	  (insert (shell-command-to-string "pbpaste")))
  (defun paste-from-system-clipboard ()
	(interactive)
	(insert (shell-command-to-string "xsel --clipboard --output"))))


(if (string= (shell-command-to-string "printf %s $(uname -s)") "Darwin")
	(defun copy-region-to-system-clipboard ()
	  (interactive)
	  (call-interactively 'shell-command-on-region '"pbcopy"))
  (defun copy-region-to-system-clipboard ()
	(interactive)
	(call-interactively 'shell-command-on-region '"xsel --clipboard --input")))

;; Magit bind

(global-set-key (kbd "M-g") 'magit-status)

;; Little function to compile projecting looking for the closest makefile in the FS

(defun my-make()
  (interactive)
  (let ((makefile-dir (locate-dominating-file "." "makefile")))
	(if makefile-dir
		(progn
		  (print (format "Found Makefile in %s" makefile-dir))
		  (compile (read-string
					"Insert make options: " (format "make -C %s " makefile-dir))))
	  (print "Makefile not found"))))

(defun shell-command-current-file ()
  "Invokes the requested shell command with path current file as argument and displays it in a buffer"
  (interactive)
  (if (buffer-file-name)
	  (shell-command (format "%s %s" (read-string "Program to invoke with current file as argument: ") (buffer-file-name)))
	(print "No file is currently open")))

(defun shell-command-current-file-to-string ()
  "Invokes the requested shell command with path current file as argument and returns it as a string"
  (interactive)
  (if (buffer-file-name)
	  (shell-command-to-string (format "%s %s" (read-string "Program to invoke with current file as argument: ") (buffer-file-name)))
	(print "No file is currently open")))

;; Setup multiple asynchronus shell-command
(defadvice erase-buffer (around erase-buffer-noop)
  "make erase-buffer do nothing")


(defadvice shell-command (around shell-command-unique-buffer activate compile)
  (if (or current-prefix-arg
		  (not (string-match "[ \t]*&[ \t]*\\'" command)) ;; background
		  (bufferp output-buffer)
		  (stringp output-buffer))
	  ad-do-it ;; no behavior change

	;; else we need to set up buffer
	(let* ((command-buffer-name
			(format "*background: %s*"
					(substring command 0 (match-beginning 0))))
		   (command-buffer (get-buffer command-buffer-name)))

	  (when command-buffer
		;; if the buffer exists, reuse it, or rename it if it's still in use
		(cond ((get-buffer-process command-buffer)
			   (set-buffer command-buffer)
			   (rename-uniquely))
			  ('t
			   (kill-buffer command-buffer))))
	  (setq output-buffer command-buffer-name)

	  ;; insert command at top of buffer
	  (switch-to-buffer-other-window output-buffer)
	  (insert "Running command: " command
			  "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n")

	  ;; temporarily blow away erase-buffer while doing it, to avoid
	  ;; erasing the above
	  (ad-activate-regexp "erase-buffer-noop")
	  ad-do-it
	  (ad-deactivate-regexp "erase-buffer-noop"))))
;; Defining custom completion
(add-hook 'after-init-hook 'global-company-mode)
(setq company-auto-complete t)
(eval-after-load 'company
  '(progn
	 (define-key company-active-map (kbd "C-n") 'company-complete-common-or-cycle)
	 (define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)
	 (define-key company-active-map (kbd "<tab>") 'company-complete-common)))
(evil-define-key 'insert 'evil-insert-state-map (kbd "C-n") 'company-complete)
(evil-define-key 'insert 'evil-insert-state-map (kbd "C-p") 'company-complete)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))

(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-projectile-set-filter-groups)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic))))
(evil-ex-define-cmd "ls" 'ibuffer)
;; (ggtags-mode)
;; Projectile with native indexing cus external doesnt fucking ignore files ...
(projectile-mode)
(setq projectile-indexing-method 'native)
;*******************************************************************************;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comment-style (quote extra-line))
 '(custom-safe-themes
   (quote
	("d494af9adbd2c04bec4b5c414983fefe665cd5dadc5e5c79fd658a17165e435a" "c4bd8fa17f1f1fc088a1153ca676b1e6abc55005e72809ad3aeffb74bd121d23" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "c158c2a9f1c5fcf27598d313eec9f9dceadf131ccd10abc6448004b14984767c" default)))
 '(global-company-mode nil)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(package-selected-packages
   (quote
	(helm-projectile ibuffer-projectile projectile ggtags php-mode racer babel company ac-helm auto-complete seoul256-theme moe-theme rust-mode async-await helm nord-theme subatomic-theme subatomic256-theme xterm-color green-phosphor-theme magit evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
