
;; Do not show the startup screen
(setq inhibit-startup-screen t)

;; Enables highlight mode
(global-font-lock-mode)
(global-hi-lock-mode)

;; Putting font
;;(set-face-attribute 'default nil :font "Roboto Mono Medium for Powerline 11")
;; (set-face-attribute 'default nil :font "Cascadia Code 12")
;; (setq default-frame-alist '((font . "Cascadia Code 12")))
;; (set-face-attribute 'default nil :font "Fira Code 12")
;; (setq default-frame-alist '((font . "Fira Code 12")))
(set-face-attribute 'default nil :font "JetBrains Mono Bold 12")
(setq default-frame-alist '((font . "JetBrains Mono Bold 12")))

(defun load-graphical-env (frame)
  ;; (load-theme 'atom-dark 'NO-CONFIRM)
  ;; (setq atom-dark-theme-force-faces-for-mode nil)
  (load-theme 'doom-rouge 'NO-CONFIRM)
  )

(defun load-term-env ()
  ;; (load-theme 'atom-dark 'NO-CONFIRM)
  ;; (setq atom-dark-theme-force-faces-for-mode nil)
  (load-theme 'doom-rouge 'NO-CONFIRM)
  )

;; Not using with light themes
(add-hook 'after-init-hook (lambda ()
  (when (fboundp 'auto-dim-other-buffers-mode)
    (auto-dim-other-buffers-mode t))))

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


;; Opting out of powerline because it's not easily configurable and I find the provided themes ugly / messy
;; (use-package powerline
;; 			 :config
;; 			 (powerline-vim-theme))

(use-package spaceline-config
  :config
  (setq spaceline-anzu-p 1)
  (setq spaceline-minor-modes-p nil)
  (setq spaceline-buffer-size-p nil)
  (setq spaceline-projectile-root-p 1)
  (setq spaceline-buffer-modified-p nil)
  (setq spaceline-buffer-position-p nil)
  (setq spaceline-buffer-encoding-abbrev-p nil)
  (setq powerline-default-separator "bar")
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (spaceline-spacemacs-theme))

(use-package ligature
  ;;:load-path "path-to-ligature-repo"
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--"
									   "####" "~~>" "***" "||=" "||>"
									   ":::" "::=" "=:=" "===" "==>"
									   "=!=" "=>>" "=<<" "=/=" "!=="
									   "!!." ">=>" ">>=" ">>>" ">>-"
									   ">->" "->>" "-->" "---" "-<<"
									   "<~~" "<~>" "<*>" "<||" "<|>"
									   "<$>" "<==" "<=>" "<=<" "<->"
									   "<--" "<-<" "<<=" "<<-" "<<<"
									   "<+>" "</>" "###" "#_(" "..<"
									   "..." "+++" "/==" "///" "_|_"
									   "www" "&&" "^=" "~~" "~@" "~="
									   "~>" "~-" "**" "*>" "*/" "||"
									   "|}" "|]" "|=" "|>" "|-" "{|"
									   "[|" "]#" "::" ":=" ":>" ":<"
									   "$>" "==" "=>" "!=" "!!"  ">:"
									   ">=" ">>" ">-" "-~" "-|" "->"
									   "--" "-<" "<~" "<*" "<|" "<:"
									   "<$" "<=" "<>" "<-" "<<" "<+"
									   "</" "#{" "#[" "#:" "#=" "#!"
									   "##" "#(" "#?" "#_" "%%" ".="
									   ".-" ".."  ".?"  "+>" "++" "?:"
									   "?=" "?."  "??"  ";;" "/*" "/="
									   "/>" "//" "__" "~~" "(*" "*)"
									   "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

(global-prettify-symbols-mode 1)

(defun pretty-lambda ()
  "Make lambda show as a pretty symbol"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          ("Lambda" . 955) ; λ
          )))
