
;; This is a smarter fill mode that understands line prefixes
;; Helps with lists and quoted replies in emails
(condition-case err
    (progn
      (require 'filladapt)
      (add-hook 'text-mode-hook 'turn-on-filladapt-mode))
  (error
   (message " Unable to use filladapt mode: %s" (cdr err))))

;; AutoFill aka Line Wrap
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; See if we have aspell or ispell...
(if (or (file-exists-p "~/bin/aspell")
        (file-exists-p "/usr/local/bin/aspell")
        (file-exists-p "/usr/bin/aspell")
        (file-exists-p "/bin/aspell"))
    (progn
      (setq-default ispell-program-name "aspell")
      ;; We have aspell, we can do fly-spell
      (add-hook 'text-mode-hook 'flyspell-mode)
    )
  (progn
    (if (or (file-exists-p "~/bin/ispell")
            (file-exists-p "/usr/local/bin/ispell")
            (file-exists-p "/usr/bin/ispell")
            (file-exists-p "/bin/ispell"))
        (progn
          ;; We have ispell, it's not aspell but we can do fly-spell with it
          (add-hook 'text-mode-hook 'flyspell-mode)
          )
      )
))

;; Notifies auto-fill and such what buffers are text-mode
(add-hook 'text-mode-hook 'text-mode-hook-identify)

;; EOF
