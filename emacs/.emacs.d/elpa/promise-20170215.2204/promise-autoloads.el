;;; promise-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "promise" "promise.el" (23078 28370 141486
;;;;;;  503000))
;;; Generated autoloads from promise.el

(autoload 'promise-chain "promise" "\
Extract the following code...

    (promise-chain (promise-new ...)
      (then
       (lambda (value)
         ...))

      (promise-catch
       (lambda (reason)
         ...))

      (done
       (lambda (value)
         ...)))

as below.

    (let ((promise (promise-new ...)))
      (setf promise (promise-then promise
                                  (lambda (value)
                                    ...)))

      (setf promise (promise-catch promise
                                   (lambda (value)
                                     ...)))

      (setf promise (promise-done promise
                                  (lambda (reason)
                                    ...))))

\(fn &rest BODY)" nil t)

(function-put 'promise-chain 'lisp-indent-function '1)

;;;***

;;;### (autoloads nil nil ("promise-core.el" "promise-done.el" "promise-es6-extensions.el"
;;;;;;  "promise-finally.el" "promise-pkg.el" "promise-rejection-tracking.el")
;;;;;;  (23078 28370 171487 762000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; promise-autoloads.el ends here
