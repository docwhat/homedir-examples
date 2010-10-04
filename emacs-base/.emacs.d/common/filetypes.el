;;;; Various extensions...

;; This is missing for some reason....
(add-to-list 'auto-mode-alist '("\\.tar.gz\\'" . archive-mode))

;; Mozilla Extensions
(add-to-list 'auto-mode-alist '("\\.xpi\\'"    . archive-mode))

;; Additional html extensions
(add-to-list 'auto-mode-alist
             (cons (concat "\\." (regexp-opt '("xhtml" "htm" "pt" "xul" "dtml") t) "\\'")
                   'html-mode))

;; If we have nxml, switch to that
(if (fboundp 'nxml-mode)
    (progn
      (require 'fmode)
      (fmode-replace-default-mode 'xml-mode 'nxml-mode)
      (fmode-replace-default-mode 'sgml-mode 'nxml-mode)
      (fmode-replace-default-mode 'html-mode 'nxml-mode)
      
      )
)

;; ZSH completion funcs
(add-to-list 'auto-mode-alist '("/_" . sh-mode))

;; Mutt mode hooks - from http://fsinfo.cs.uni-sb.de/~abe/mutt/
(defun mutt-mode-hook () 
  (turn-on-auto-fill) ;;; Auto-Fill is necessary for mails 
  (turn-on-font-lock) ;;; Font-Lock is always cool *g* 
  (flush-lines "^\\(> \n\\)*> -- \n\\(\n?> .*\\)*") ;;; Kills quoted sigs.
  (not-modified)      ;;; We haven't changed the buffer, haven't we? *g* 
  (mail-text)         ;;; Jumps to the beginning of the mail text 
  (setq make-backup-files nil) ;;; No backups necessary.
  )
(or (assoc "mutt-" auto-mode-alist)
    (setq auto-mode-alist (cons '("mutt-" . mail-mode) auto-mode-alist)))
(add-hook 'mail-mode-hook 'mutt-mode-hook)
