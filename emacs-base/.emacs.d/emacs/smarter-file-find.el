
;;; Smarter `read-file-name'.
;;;
;;; `minibuffer-electric-slash' stolen from XEmacs.
;;; Minor-mode:ized by Anders Lindgren.

(when (not (featurep 'xemacs) )
  (if (not (fboundp 'minibuffer-electric-slash))
      (progn      
        (defvar my-electric-file-mode nil)
        (defvar my-electric-file-mode-map (make-sparse-keymap))
        (make-local-variable 'my-electric-file-mode)
        
        (defun minibuffer-electric-slash ()
          ;; by Stig@hackvan.com
          (interactive)
          (and (eq ?/ (preceding-char))
               ;; permit `//hostname/path/to/file'
               (not (eq (point) (1+ (point-min)))) 
               ;; permit `http://url/goes/here'
               (not (eq ?: (char-after (- (point) 2))))
               (delete-region (point-min) (point)))
          (insert ?/))
        
        (defun minibuffer-electric-tilde ()
          (interactive)
          (and (eq ?/ (preceding-char))
               (delete-region (point-min) (point)))
          (insert ?~))
        
        (defun minibuffer-electric-dollar ()
          (interactive)
          (and (eq ?/ (preceding-char))
               (delete-region (point-min) (point)))
          (insert ?$))
        
        (define-key my-electric-file-mode-map "/" 'minibuffer-electric-slash)
        (define-key my-electric-file-mode-map "~" 'minibuffer-electric-tilde)
        (define-key my-electric-file-mode-map "$" 'minibuffer-electric-dollar)
        
        (setq minor-mode-map-alist (cons (cons 'my-electric-file-mode 
                                               my-electric-file-mode-map)
                                         minor-mode-map-alist))
        
        (defun my-electric-minibuffer-setup ()
          (setq my-electric-file-mode       
                (and (boundp 'minibuffer-completion-table)
                     (eq minibuffer-completion-table 'read-file-name-internal))))
        (defun my-electric-minibuffer-exit ()
          (setq my-electric-file-mode nil))
        (add-hook 'minibuffer-setup-hook 'my-electric-minibuffer-setup)
        (add-hook 'minibuffer-exit-hook  'my-electric-minibuffer-exit)
        )
    )
  )

