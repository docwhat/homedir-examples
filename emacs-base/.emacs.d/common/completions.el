;; This is for word completions.  Something that makes life when programming
;; The key for this is, by default, M-/

(condition-case err
    (progn
      (require 'hippie-exp)
      (eval-after-load "dabbrev" '(defalias 'dabbrev-expand 'hippie-expand))
      )
  (error (setq message-log-max t)
         (message "Hippie-expand not loaded: %s" 
                  (cdr err))
         ))


(setq dabbrev-case-fold-search nil)
(setq hippie-expand-try-functions-list 
      (quote (try-expand-dabbrev-visible
              try-expand-all-abbrevs
              try-expand-line
              try-expand-line-all-buffers
              try-expand-list
              try-expand-list-all-buffers
              try-expand-dabbrev
              try-expand-dabbrev-all-buffers
              try-expand-dabbrev-from-kill
              try-complete-file-name-partially
              try-complete-file-name
              ;; Lisp stuff only is helpful if
              ;; you're in lisp mode
              ;try-complete-lisp-symbol-partially
              ;try-complete-lisp-symbol
              try-expand-whole-kill
              )
             ))

;; EOF
