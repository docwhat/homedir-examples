;; Set all files to backup in ~/emacs.d/backups instead of
;; in the same directory
(setq-default backup-directory-alist 
              (list 
               (cons ".*" ; a regex, not glob
                     (expand-file-name "~/.emacsbackup/")
                     )
               ))

;; Preserve hard links when editing
(setq-default backup-by-copying-when-linked t)

;; Preserve owner and group of the file you're editing
(setq-default backup-by-copying-when-mismatch t)

;; EOF
