;;; async-await-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "async-await" "async-await.el" (23078 28370
;;;;;;  908185 348000))
;;; Generated autoloads from async-await.el

(autoload 'async-defun "async-await" "\
Define NAME as a Async Function. The Async Function returns Promise.

 (defun wait-async (n)
   (promise-new (lambda (resolve _reject)
                  (run-at-time n
                               nil
                               (lambda ()
                                 (funcall resolve n))))))

 (async-defun foo-async ()
   (print (await (wait-async 0.5)))
   (message \"---\")

   (print (await (wait-async 1.0)))
   (message \"---\")

   (print (await (wait-async 1.5)))
   (message \"---\")

   (message \"await done\"))

 (foo-async)

\(fn NAME ARGLIST &rest BODY)" nil t)

(function-put 'async-defun 'doc-string-elt '3)

(function-put 'async-defun 'lisp-indent-function '2)

(autoload 'async-lambda "async-await" "\
Return a lambda Async Function. The Async Function returns Promise.

 (defun wait-async (n)
   (promise-new (lambda (resolve _reject)
                  (run-at-time n
                               nil
                               (lambda ()
                                 (funcall resolve n))))))

 (setq foo-async (async-lambda ()
                   (print (await (wait-async 0.5)))
                   (message \"---\")

                   (print (await (wait-async 1.0)))
                   (message \"---\")

                   (print (await (wait-async 1.5)))
                   (message \"---\")

                   (message \"await done\")))

 (funcall foo-async)

\(fn ARGLIST &rest BODY)" nil t)

(function-put 'async-lambda 'doc-string-elt '2)

(function-put 'async-lambda 'lisp-indent-function 'defun)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; async-await-autoloads.el ends here
