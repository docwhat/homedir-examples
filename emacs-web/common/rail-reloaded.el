
(if (>= emacs-major-version 22)
    (progn
      (setq load-path (cons (expand-file-name "~/.emacs.d/rails-reloaded") load-path))
      (require 'rails-autoload)

      ;; Function to help completion by populating the file-cache.
      ;; http://www.emacswiki.org/emacs/RubyOnRails
      (require 'filecache)
      (defun rails-add-proj-to-file-cache (dir)
        "Adds all the ruby and rhtml files recursively in the current directory to the file-cache"
        (interactive "DAdd directory: ")
        (file-cache-clear-cache)
        (file-cache-add-directory-recursively dir (regexp-opt (list ".rb" ".rhtml" ".xml" ".js" ".yml")))
        (file-cache-delete-file-regexp "\\.svn"))))
