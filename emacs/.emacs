;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    .emacs                                             :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ade-sede <adrien.de.sede@gmail.com>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2017/12/07 08:49:59 by ade-sede          #+#    #+#              ;
;    Updated: 2017/12/11 05:28:25 by ade-sede         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

;; Conditionally loads the local site-lisp folder containing 42header ressources
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
	(load-theme 'nord 'NO-CONFIRM)
	;(load-theme 'deeper-blue 'NO-CONFIRM)
	;(load-theme 'subatomic 'NO-CONFIRM)
  ; else part
  ;(load-theme 'subatomic256 'NO-CONFIRM)
  (load-theme 'nord 'NO-CONFIRM)
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

;*******************************************************************************;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comment-style (quote extra-line))
 '(custom-safe-themes
   (quote
	("c4bd8fa17f1f1fc088a1153ca676b1e6abc55005e72809ad3aeffb74bd121d23" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "c158c2a9f1c5fcf27598d313eec9f9dceadf131ccd10abc6448004b14984767c" default)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(package-selected-packages
   (quote
	(async-await helm nord-theme subatomic-theme subatomic256-theme xterm-color evil-magit green-phosphor-theme magit evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
