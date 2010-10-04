(if (and window-system (not (featurep 'aquamacs)))
    (progn
      (setq my-font-point nil)
      (setq my-font-family nil)
      ;; Font Try and Except type thingy. Original version is from
      ;; http://www.dotemacs.de/recovery.html
      (defun safe-set-face-font (face family weight point &optional frame)
        "Safe version of \\[set-face-font]"
        (interactive (read-face-and-attribute :family :weight :point))
        (let ((my-font (format
                      "-*-%s-%s-r-normal-*-*-%s0-*-*-*-*-*-*"
                      family weight point)))
          (condition-case err
              (progn
                (set-face-font face my-font frame)
                (message "Set font-face '%s' to '%s'" face my-font)
                (setq my-font-point  point)
                (setq my-font-family family)
                t) ; returns t
            (error (setq message-log-max t)
                   (message "Cannot set '%s' face-font to '%s'"
                            face my-font)
                   nil ; return nil
                   )
          )))

      (setq screen-width  (x-display-pixel-width)
            screen-height (x-display-pixel-height))

      ;; We use the height to determine the font since displays are
      ;; usually wider than normal rather than taller than normal
      (cond
       ((>= screen-height 1200) (setq my-font-point 18))
       ((>= screen-height 1024) (setq my-font-point 16))
       ((>= screen-height 800)  (setq my-font-point 14))
       (t                       (setq my-font-point 12))
       )



      ;; Try the fonts one by one; stop after the first success
      (or
       (safe-set-face-font 'default "dejavu sans mono" "medium" my-font-point)
       (safe-set-face-font 'default "neep" "medium" my-font-point)
       (safe-set-face-font 'default "neep" "medium" (- my-font-point 2))
       (safe-set-face-font 'default "profont" "medium" (+ my-font-point 1))
       (safe-set-face-font 'default "terminus" "medium" my-font-point)
       )

      ;; bold fonts
      (if my-font-family
          (safe-set-face-font 'bold my-font-family "bold" my-font-point))

      ;; Make the font global
      (add-to-list 'default-frame-alist (cons 'font (face-font 'default)))

      )); end-if window-system

;(add-hook 'after-make-frame-functions
;          '(lambda(&optional frame width height all-windows-p)
;             (set-frame-size (selected-frame) 80 40)))

;; EOF
