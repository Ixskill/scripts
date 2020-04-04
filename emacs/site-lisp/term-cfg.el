
; Quill terminal buffer when closing terminal
(defadvice term-handle-exit
    (after term-kill-buffer-on-exit activate)
  (kill-buffer))

;; shell defaults to zsh. taking path into account using env
(setq explicit-shell-file-name "/usr/bin/env zsh")

(defun my-ansi-term ()
  (interactive)
  (split-window-sensibly)
  (other-window 1)
  (ansi-term (executable-find "bash")))
