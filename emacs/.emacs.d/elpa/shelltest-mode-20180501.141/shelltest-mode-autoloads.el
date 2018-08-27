;;; shelltest-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "shelltest-mode" "shelltest-mode.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from shelltest-mode.el

(autoload 'shelltest-find "shelltest-mode" "\
Edit the test file that corresponds to the currently edited file.

The opened file is file.test in `shelltest-directory', where `file'
is the name of the currently edited file with its extension removed.
If `shelltest-other-window' is non-nil, open the file in another window.

\(fn)" t nil)

(autoload 'shelltest-run "shelltest-mode" "\
Run the test file associated with the currently edited file.

The command to be run is determined by `shelltest-command'.  Its argument
is `shelltest-directory' with file.test appended, where `file' is the name
of the currently edited file with its extension removed.

\(fn)" t nil)

(autoload 'shelltest-run-all "shelltest-mode" "\
Run all test files.

The command to be run is determined by `shelltest-command'.  Its argument
is `shelltest-directory'.

\(fn)" t nil)

(autoload 'shelltest-mode "shelltest-mode" "\
Major mode for shelltestrunner.

See URL `http://joyful.com/shelltestrunner'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "shelltest-mode" '("shelltest-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; shelltest-mode-autoloads.el ends here
