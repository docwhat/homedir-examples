;; Set the color to something easier on the eyes

(condition-case theme-err
    (progn
      ;; Using GNA Color Theme if we got it.
      (require 'color-theme)
      (setq color-theme-is-global t)
      (color-theme-clarity)
      (message "Using color-theme system.")
      )
  (error
   (progn
     (message "Using old-style color system: %s" theme-err)
     ;; Cheat Sheet:
     ;; http://www.cs.cornell.edu/courses/cs312/2001sp/handouts/customize.html
     
     ;; Main Colors
     (add-to-list 'default-frame-alist '(foreground-color . "#f0f0f0"))
     (add-to-list 'default-frame-alist '(background-color . "#0d0d0d"))
     (add-to-list 'default-frame-alist '(cursor-color . "#008800"))
     ;; Must go prior to initializing font-lock:
     (add-to-list 'default-frame-alist '(background-mode . dark))
     
     ;; Current Line
     (condition-case err
         (if window-system
             (progn (highlight-current-line-on 1)
                    (highlight-current-line-set-bg-color "#024")
                    ))
       (error
        (message "Failed to turn on current line highlighting: %s"
                 (cdr err))
        ))

     ;; Builtin features
     (set-face-foreground 'font-lock-builtin-face "#4ed")

     ;; Comments
     (set-face-foreground 'font-lock-comment-face "#77d")

     ;; Strings
     (set-face-foreground 'font-lock-string-face "#3c3")

     ;; Variable Name
     (set-face-foreground 'font-lock-variable-name-face "#9f9")

     ;; Warning
     (set-face-foreground 'font-lock-warning-face "#f20")
     (if window-system
         (set-face-background 'font-lock-warning-face "#210")
       (set-face-background 'font-lock-warning-face "#000"))

     ;; Region
     (if window-system
         (progn (set-face-foreground 'region "#ff0")
                (set-face-background 'region "#332"))
       (progn (set-face-foreground 'region "yellow")
              (set-face-background 'region "black")))

     ;; Menu Bar
     (set-face-foreground 'menu "#000")
     (set-face-background 'menu "#789")

     ;; Scroll Bar
     (set-face-foreground 'scroll-bar "#000")
     (set-face-background 'scroll-bar "#789")

     (custom-set-faces
      '(diff-header-face      ((t (:foreground "light blue"  :background "black"))) 'now)
      '(diff-file-header-face ((t (:foreground "light green" :background "black"))) 'now)
                                        ;diff-index-face
      '(diff-hunk-header-face ((t (:foreground "gold"        :background "chocolate4"))) 'now)
      '(diff-removed-face     ((t (:foreground "orange"      :background "black"))) 'now)
      '(diff-added-face       ((t (:foreground "green"       :background "black"))) 'now)
      '(diff-changed-face     ((t (:foreground "yellow"      :background "black"))) 'now)
                                        ;diff-function-face
      '(diff-context-face     ((t (:foreground "grey70"      :background "black"))) 'now)
      '(diff-nonexistent-face ((t (:foreground "black"       :background "red"))) 'now)
      )
     )
))

;; EOF
