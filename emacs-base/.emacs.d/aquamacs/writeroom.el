(defun writeroom ()
  "Switches to a WriteRoom-like fullscreen style"
  (interactive)	
  (when (featurep 'aquamacs)
    (aquamacs-toggle-full-frame)))

