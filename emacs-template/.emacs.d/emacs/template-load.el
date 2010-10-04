;; Documentation links:
;; http://emacswiki.org/cgi-bin/wiki/TemplatesMode
;; http://emacs-template.sourceforge.net/

;; This is needed to initialize the template system
(require 'template)
(template-initialize)
(setq template-default-directories 
      (list
       (expand-file-name "~/.emacs.d/templates/")
       (expand-file-name "~/.emacs.d/templates/defaults")
))

(add-to-list 
 'template-expansion-alist
 '("GUIID" (insert (substring (shell-command-to-string "uuidgen") 0 -1))))

