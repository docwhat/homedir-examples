
(define-skeleton local-variables-section
  "Insert a local variables section.  Use current comment syntax if any."
  (completing-read "Mode: " obarray
                   (lambda (symbol)
                     (if (commandp symbol)
                         (string-match "-mode$" (symbol-name symbol))))
                   t)
  '(save-excursion
     (if (re-search-forward page-delimiter nil t)
         (error "Not on last page.")))
  comment-start "Local Variables:" comment-end \n
  comment-start "mode: " str
  & -5 | '(kill-line 0) & -1 | comment-end \n
  ( (completing-read (format "Variable, %s: " skeleton-subprompt)
                     obarray
                     (lambda (symbol)
                       (or (eq symbol 'eval)
                           (user-variable-p symbol)))
                     t)
    comment-start str ": "
    (read-from-minibuffer "Expression: " nil read-expression-map nil
                          'read-expression-history) | _
                          comment-end \n)
  resume:
  comment-start "End:" comment-end \n)

;; EOF
