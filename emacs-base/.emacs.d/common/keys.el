;; Favorite keyboard shortcuts

;; Goto Line
(global-set-key "\C-c\C-g"            'goto-line)

;; Goto Char
; doesn't work...should be capital G
;(global-set-key "\C-c\C-G"            'goto-char)

;; Evaluates lisp function at cursor
(global-set-key "\C-c\C-l"        'eval-defun)

;; Comment Region
(global-set-key "\C-c#" 'comment-region)
(global-set-key "\C-c3" 'uncomment-region)

;; We are RegEx fans here...
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)

;; Don't iconify in windowing systems with C-z
(when window-system
  (global-unset-key "\C-z")) ; iconify-or-deiconify-frame (C-x C-z)


;; Don't allow the default kill in windowing systems
(when window-system
  (server-start)
  (defun better-kill-emacs ()
    "A better kill-emacs:
    If running under gnuserver, then close the client or the window.
    Otherwise do kill-emacs like normal."
    (interactive)
    (if (eq window-system 'mac)
        (kill-buffer-and-window)
        (condition-case nil
            (progn
              gnuserv-clients ; verify that the variable exists...
              (condition-case nil (gnuserv-edit) (error (delete-frame))))
          (error (kill-emacs))
          )))
  (global-set-key "\C-x\C-c" 'better-kill-emacs)
)

;; A customized list buffers
(defun my-list-buffers (arg)
  "Be more friendly when listing buffers.
    Originally from Nick Borko."
  (interactive "p")
  (list-buffers t)    ;; show only file based buffers
  (other-window 1 t)  ;; go to the buffer list
  (next-line 1)       ;; move down one, since the top one is the current buffer
  ;; (local-set-key "q" (lambda ()
  ;;                         (interactive) 
  ;;                        (other-window -1 t)
  ;;                        (delete-other-windows)
  ;;                        )) 
  )
(global-set-key "\C-x\C-b"		  'my-list-buffers)
; Allow . instead of 1, since on dvorak, it's in a better place
(define-key Buffer-menu-mode-map "." 'Buffer-menu-1-window)

;; Find Matching Paren
(defun find-matching-paren ()
  "Locate the matching parenthtical" (interactive)
  (cond ((looking-at "[[({]") (forward-sexp 1) (backward-char 1))
        ((looking-at "[])}]") (forward-char 1) (backward-sexp 1))
        (t (ding))
        )
  )
(global-set-key "\C-c\C-m" (quote find-matching-paren))

;; Note: See the pager stuff for more key bindings.

;; auto-indent pasted code
(defadvice yank (after indent-region activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode c-mode c++-mode
                objc-mode latex-mode plain-tex-mode python-mode))
      (indent-region (region-beginning) (region-end) nil)))

(defadvice yank-pop (after indent-region activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode c-mode c++-mode
                objc-mode latex-mode plain-tex-mode python-mode))
      (indent-region (region-beginning) (region-end) nil)))


;; EOF
