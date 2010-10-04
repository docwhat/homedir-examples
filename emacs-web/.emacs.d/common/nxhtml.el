(if (>= emacs-major-version 22)
    (progn
      (load "~/.emacs.d/nxhtml/autostart.el")
      ;; Additional html extensions
      (add-to-list 'auto-mode-alist
                   (cons (concat "\\." (regexp-opt '("xhtml" "htm" "pt" "xul" "dtml") t) "\\'")
                         'nxhtml-mode))
      (remove-unwanted-alist-entry 'xml-mode auto-mode-alist)
      (remove-unwanted-alist-entry 'html-mode auto-mode-alist)
      (remove-unwanted-alist-entry 'html-helper-mode auto-mode-alist)
      (if (boundp 'magic-mode-alist)
          (let () 
            (remove-unwanted-alist-entry 'xml-mode magic-mode-alist)
            (remove-unwanted-alist-entry 'html-mode magic-mode-alist)))
            (remove-unwanted-alist-entry 'html-helper-mode magic-mode-alist)

      ))
