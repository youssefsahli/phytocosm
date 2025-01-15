(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ignored-local-variable-values '((apheleia-formatter . raco-fmt-col)))
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(safe-local-variable-values
   '((apheleia-formatters
      (raco-fmt "raco" "fmt"))
     (apheleia-formatter . raco-fmt)
     (apheleia-formatters
      (raco-fmt "raco" "fmt" "--width" "80"))
     (apheleia-formatters quote
      ((raco-fmt "raco" "fmt" "--width" "80")))
     (eval setq apheleia-formatters
      (cons
       '(raco-fmt-col "raco" "fmt" "--width" "80")
       apheleia-formatters))
     (apheleia-formatters
      (raco-fmt-col "raco" "fmt" "--width" "80"))
     (apheleia-formatters
      (raco-fmt-col "raco" "fmt" "--width" 80))
     (apheleia-formatters quote
      ((raco-fmt-col "raco" "fmt" "--width" 80)))
     (apheleia-formatter quote
      ((raco-fmt "raco" "fmt" ""))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-page 'disabled nil)
