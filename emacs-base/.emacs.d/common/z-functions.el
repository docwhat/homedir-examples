(defun create-scratch-buffer nil
  "create or recreate a scratch buffer"
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (erase-buffer)
  (insert initial-scratch-message)
  (lisp-interaction-mode))             

(defun make-gtk-device nil
  "Dummy to prevent gnuserve from borking"
  nil
  )

;; override emacs defaults
(defun remove-unwanted-alist-entry (unwanted-mode an-alist)
  (delete-if
   (lambda (x)
     (and (listp x) (equalp (cdr x) unwanted-mode)))
   an-alist))

;; try-require -- a way to load a feature and init, if it exists.
;; Example usage:
;;   (if (try-require 'some-feature)
;;       (progn
;;         ...init stuff...
;;         ))
(defvar missing-packages-list nil
  "List of packages that `try-require' can't find.")
(defun try-require (feature)
  "Attempt to load a library or module. Return true if the
library given as argument is successfully loaded. If not, instead
of an error, just add the package to a list of missing packages."
  (condition-case err
      ;; protected form
      (progn
        (message "Checking for library `%s'..." feature)
        (if (stringp feature)
            (load-library feature)
          (require feature))
        (message "Checking for library `%s'... Found" feature))
    ;; error handler
    (file-error  ; condition
     (progn
       (message "Checking for library `%s'... Missing" feature)
       (add-to-list 'missing-packages-list feature 'append))
     nil)))
