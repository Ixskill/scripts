(use-package dap-gdb-lldb)
(use-package dap-python)


;; Snippet used as ref to make my bindings
;; (let ((bindings (list
;; 				  ;; transient state
;; 				  "d."  #'dap-hydra
;; 				  ;; repl
;; 				  "d'"  #'dap-ui-repl
;; 				  ;; abandon
;; 				  "da"  #'dap-disconnect
;; 				  "dA"  #'dap-delete-all-sessions
;; 				  ;; breakpoints
;; 				  "dbb" #'dap-breakpoint-toggle
;; 				  "dbc" #'dap-breakpoint-condition
;; 				  "dbl" #'dap-breakpoint-log-message
;; 				  "dbh" #'dap-breakpoint-hit-condition
;; 				  "dba" #'dap-breakpoint-add
;; 				  "dbd" #'dap-breakpoint-delete
;; 				  "dbD" #'dap-breakpoint-delete-all
;; 				  ;; debuging/running
;; 				  "ddd" #'dap-debug
;; 				  "dde" #'dap-debug-edit-template
;; 				  "ddl" #'dap-debug-last
;; 				  "ddr" #'dap-debug-recent
;; 				  ;; eval
;; 				  "dee" #'dap-eval
;; 				  "der" #'dap-eval-region
;; 				  "det" #'dap-eval-thing-at-point
;; 				  "det" #'dap-ui-expressions-add
;; 				  ;; inspect
;; 				  "dIi" #'dap-ui-inspect
;; 				  "dIr" #'dap-ui-inspect-region
;; 				  "dIt" #'dap-ui-inspect-thing-at-point
;; 				  ;; stepping
;; 				  "dc"  #'dap-continue
;; 				  "di"  #'dap-step-in
;; 				  "do"  #'dap-step-out
;; 				  "dr"  #'dap-restart-frame
;; 				  "ds"  #'dap-next
;; 				  "dv"  #'dap-ui-inspect-thing-at-point
;; 				  ;; switching
;; 				  "dSs" #'dap-switch-session
;; 				  "dSt" #'dap-switch-thread
;; 				  "dSf" #'dap-switch-frame
;; 				  ;; windows
;; 				  "dwo" #'dap-go-to-output-buffer
;; 				  "dwl" #'dap-ui-locals
;; 				  "dws" #'dap-ui-sessions
;; 				  "dwb" #'dap-ui-breakpoints))
;; 	   (prefixes '(("d"  . "debug")
;; 				   ("db" . "breakpoints")
;; 				   ("dd" . "debugging")
;; 				   ("de" . "eval")
;; 				   ("dI" . "inspect")
;; 				   ("dS" . "switch")
;; 				   ("dT" . "toggles")
;; 				   ("dw" . "debug windows")))))

;; DAP-MAP
(defvar dap-map (make-sparse-keymap))
(define-prefix-command 'dap-map)


;; Window-map
(defvar dap-window-map (make-sparse-keymap))
(define-prefix-command 'dap-window-map)
(define-key dap-map (kbd "w") 'dap-window-map)
(define-key dap-window-map (kbd "e") 'dap-ui-expressions)
(define-key dap-window-map (kbd "o") 'dap-go-to-output-buffer)
(define-key dap-window-map (kbd "l") 'dap-ui-locals)
(define-key dap-window-map (kbd "s") 'dap-ui-sessions)
(define-key dap-window-map (kbd "b") 'dap-ui-breakpoints-list)

(defvar dap-breakpoint-map (make-sparse-keymap))
(define-prefix-command 'dap-breakpoint-map)
(define-key dap-map (kbd "b") 'dap-breakpoint-map)
(define-key dap-breakpoint-map (kbd "t") 'dap-breakpoint-toggle)
(define-key dap-breakpoint-map (kbd "c") 'dap-breakpoint-condition)
(define-key dap-breakpoint-map (kbd "l") 'dap-breakpoint-log-message)
(define-key dap-breakpoint-map (kbd "h") 'dap-breakpoint-hit-condition)
(define-key dap-breakpoint-map (kbd "a") 'dap-breakpoint-add)
(define-key dap-breakpoint-map (kbd "d") 'dap-breakpoint-delete)
(define-key dap-breakpoint-map (kbd "D") 'dap-breakpoint-delete-all)

(defvar dap-expression-map (make-sparse-keymap))
(define-prefix-command 'dap-expression-map)
(define-key dap-map (kbd "E") 'dap-expression-map)
(define-key dap-expression-map (kbd "a") 'dap-ui-expressions-add)
(define-key dap-expression-map (kbd "d") 'dap-ui-expressions-remove)
(define-key dap-expression-map (kbd "r") 'dap-ui-expressions-refresh)

(defvar dap-eval-map (make-sparse-keymap))
(define-prefix-command 'dap-eval-map)
(define-key dap-map (kbd "e") 'dap-eval-map)
(define-key dap-eval-map (kbd "e") 'dap-eval)
(define-key dap-eval-map (kbd "r") 'dap-eval-region)
(define-key dap-eval-map (kbd "t") 'dap-eval-thing-at-point)

(defvar dap-switch-map (make-sparse-keymap))
(define-prefix-command 'dap-switch-map)
(define-key dap-map (kbd "S") 'dap-switch-map)
(define-key dap-switch-map (kbd "s") 'dap-switch-session)
(define-key dap-switch-map (kbd "t") 'dap-switch-thread)
(define-key dap-switch-map (kbd "f") 'dap-switch-frame)
(define-key dap-switch-map (kbd "d") 'dap-delete-all-sessions)


(define-key mode-specific-map (kbd "d") 'dap-map)
(define-key dap-map (kbd "RET") 'dap-debug)
(define-key dap-map (kbd "c") 'dap-continue)
(define-key dap-map (kbd "i") 'dap-step-in)
(define-key dap-map (kbd "o") 'dap-step-out)
(define-key dap-map (kbd "r") 'dap-restart-frame)
(define-key dap-map (kbd "n") 'dap-next)
(define-key dap-map (kbd "D") 'dap-disconnect)
(define-key dap-map (kbd "l") 'dap-debug-last)
(define-key dap-map (kbd "p") 'dap-debug-recent)
(define-key dap-map (kbd "'") 'dap-ui-repl)


(use-package dap-mode
  :hook (dap-mode . (dap-ui-mode 1))
  :hook (dap-mode . (dap-tooltip-mode 1))
  :hook (dap-mode . (tooltip-mode 1))
  :hook (dap-mode . (dap-ui-controls-mode 1))
  :hook (dap-mode . (push dap-map 'minor-mode-map-alist)))

(provide 'dap)
;;; dap.el ends here
