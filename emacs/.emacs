;;ads the local site-lisp folder containing 42header ressources
(if (string= (shell-command-to-string "printf %s $(uname -s)") "Darwin")
	(setq config_files "/usr/share/emacs/site-lisp/")
  (setq config_files (concat (getenv "DOTFILES") "/emacs/site-lisp/")))
(setq vc-follow-symlinks t)

;; Sourcing packages 
(setq load-path (append (list nil config_files) load-path)) (load "list.el")
(load "string.el")
(load "comments.el")
(load "header.el")
(load "custom-functions.el")
(load "style.el")
(load "prog-style.el")
(load "package-manager.el")
(load "misc.el")
(load "compilation.el")


(use-package helm-config
  :bind ("M-x" . 'helm-M-x))

(use-package dap-gdb-lldb)

(use-package helm-projectile
  :config (helm-projectile-on))

(use-package org
  :mode (("\\.org$" . org-mode))
  :ensure org-plus-contrib)

(use-package evil
  :init 
  :config (evil-mode)
  (evil-set-initial-state 'ansi-term 'emacs)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-select-search-module 'evil-search-module 'evil-search)
  (evil-ex-define-cmd "ls" 'ibuffer)
  (setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))
  (evil-define-key 'insert 'evil-insert-state-map (kbd "C-]") 'lsp-ui-peek-find-definitions)
  :bind (:map evil-normal-state-map
			  ;;("C-]" . lsp-ui-peek-find-definitions)
			  :map evil-insert-state-map
			  ("C-n" . company-complete)
			  ("C-p" . company-complete)))
(use-package toml-mode)

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package evil-surround
  :config (global-evil-surround-mode))

(use-package magit
  :ensure t
  :bind (("M-g" . magit-status))
  :config
  (global-auto-revert-mode t) ;; Auto revert allows for easy branch checkout within emacs
  (setq auto-revert-check-vc-info t))

(use-package ruby-mode
  :mode "\\.rb\\'"
  :interpreter "ruby"
  :config
  (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
  (setq ruby-indent-level 2))

(use-package company
  :ensure t
  :defer t
  :init
  (setq company-auto-complete t)
  :bind (:map company-active-map
			  ("C-n" . company-complete-common-or-cycle)
			  ("C-p" . company-select-previous-or-abort)
			  ("<tab>" . company-complete-common))
  :config
  (add-to-list 'company-backends '(company-lsp company-irony-c-headers company-irony))
  (global-company-mode))

(use-package ibuffer
  :init
  (add-hook 'ibuffer-hook (lambda ()
							(ibuffer-projectile-set-filter-groups)
							(unless (eq ibuffer-sorting-mode 'alphabetic)
							  (ibuffer-do-sort-by-alphabetic)))))

(use-package projectile
  :defer t
  :bind (:map projectile-mode-map
			  ("C-c p" . projectile-command-map))
  :config
  (projectile-mode +1)
  (setq projectile-project-root-files-top-down-recurring
		(append '("compile_commands.json"
				  ".ccls")
				projectile-project-root-files-top-down-recurring))
  ;;(setq projectile-indexing-method 'native)
  (setq projectile-globally-ignored-file-suffixes (list ".o")))
  

(use-package yasnippet
  :config
  (yas-global-mode 1))


(use-package lsp-mode :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

(use-package rust-mode
  :hook (rust-mode . lsp))

(use-package js2-mode
  :hook (js2-mode . npm-mode))

(use-package company-lsp :commands company-lsp
  :config
	(setq company-lsp-async 1)
	;;(setq company-lsp-enable-snippet 1)
	(setq company-lsp-enable-recompletion 1))

(use-package ccls
  :config
  (ccls-use-default-rainbow-sem-highlight)
  (setq ccls-executable "/usr/bin/ccls")
  :hook ((c-mode c++-mode objc-mode) .
		 (lambda () (require 'ccls) (lsp) (hs-minor-mode) (irony-mode) (flycheck-mode)))
 ;; (irony-mode . irony-cdb-autosetup-compile-options)
  )


(use-package evil-snipe
  :config
  (setq evil-snipe-scope 'buffer)
  (evil-snipe-mode +1))

(setq tags-add-tables nil)
(define-prefix-command 'tag-map)
(define-prefix-command 'other-window-tag-map)


(use-package powerline
  :config
  (powerline-center-evil-theme))


(use-package evil-exchange
  :config
  (evil-exchange-install))

;*******************************************************************************;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ccls-sem-highlight-method (quote overlay))
 '(comment-style (quote extra-line))
 '(custom-safe-themes
   (quote
	("d7383f47263f7969baf3856ab8b3df649eb77eafdff0c5731bee2ad18e0faed2" "ae3a3bed17b28585ce84266893fa3a4ef0d7d721451c887df5ef3e24a9efef8c" "bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" "87a431903d22fa1cbb2becd88572e7d985e28c2253935448d0d754c13e85a980" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "d494af9adbd2c04bec4b5c414983fefe665cd5dadc5e5c79fd658a17165e435a" "c4bd8fa17f1f1fc088a1153ca676b1e6abc55005e72809ad3aeffb74bd121d23" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "c158c2a9f1c5fcf27598d313eec9f9dceadf131ccd10abc6448004b14984767c" default)))
 '(global-company-mode t)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(lsp-ui-doc-border "black")
 '(lsp-ui-doc-enable t)
 '(lsp-ui-doc-header t)
 '(lsp-ui-doc-include-signature t)
 '(lsp-ui-doc-position (quote bottom))
 '(lsp-ui-doc-use-childframe t)
 '(lsp-ui-flycheck-enable t)
 '(lsp-ui-flycheck-list-position (quote right))
 '(lsp-ui-peek-always-show t)
 '(lsp-ui-peek-fontify (quote never))
 '(lsp-ui-peek-list-width 80)
 '(lsp-ui-sideline-ignore-duplicate t)
 '(lsp-ui-sideline-show-code-actions t)
 '(lsp-ui-sideline-show-hover nil)
 '(lsp-ui-sideline-update-mode (quote line))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
	(indium npm-mode ripgrep helm-lsp dap-mode lsp-treemacs cargo flycheck-rust toml-mode ccls company-lsp powerline yasnippet lsp-ui lsp-mode csv-mode focus python-mode evil-surround default-text-scale evil-exchange bash-completion rjsx-mode load-theme-buffer-local organic-green-theme company-irony nordless-theme clang-format helm-xref js-format nodejs-repl evil-snipe projectile-direnv auto-complete-clang cmake-ide ac-rtags rtags leuven-theme solarized-theme auto-dim-other-buffers company-irony-c-headers helm-ag atom-dark-theme slime-company slime irony vagrant dockerfile-mode yaml-mode enh-ruby-mode projectile-rails helm-projectile ibuffer-projectile projectile ggtags php-mode racer babel company ac-helm auto-complete seoul256-theme rust-mode async-await helm nord-theme subatomic-theme subatomic256-theme xterm-color green-phosphor-theme magit)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t nil)))
 '(lsp-face-highlight-read ((t (:foreground "green"))))
 '(lsp-face-highlight-textual ((t (:foreground "turquoise3"))))
 '(lsp-face-highlight-write ((t (:foreground "orchid"))))
 '(lsp-ui-peek-highlight ((t (:foreground "medium orchid" :box nil))))
 '(lsp-ui-peek-line-number ((t nil)))
 '(lsp-ui-peek-list ((t (:background "powder blue"))))
 '(lsp-ui-peek-peek ((t (:background "light blue"))))
 '(lsp-ui-peek-selection ((t (:background "powder blue" :weight bold :height 1.1))))
 '(lsp-ui-sideline-code-action ((t (:foreground "red" :underline (:color foreground-color :style wave)))))
 '(lsp-ui-sideline-current-symbol ((t (:foreground "orchid" :box nil :underline t :weight bold :height 0.99))))
 '(lsp-ui-sideline-symbol ((t (:foreground "lime green" :box nil :height 0.99)))))
(put 'narrow-to-region 'disabled nil)
