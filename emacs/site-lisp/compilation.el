
;; Compile options
(setq compilation-scroll-output 1)

(defun make(path rule)
  (interactive "*fMakefile location: \nsRule to use: ")
  (compile (format "make -C %s %s" path rule))
  )
