;; Turn off the useless toolbar
(condition-case nil
    (tool-bar-mode -1)
  (error nil))

;; Scroll only one line when moving past screen
(setq-default scroll-step 1)
(setq-default scroll-conservatively 1)

;; Don't ask when a buffer changes on disk, just reload it
(global-auto-revert-mode 1)

;; Make tabs behave the way I want
(setq-default tab-width 4)          ; 4 characters wide
(setq-default c-basic-offset 4)     ; needed for cc-styles mode
(setq-default indent-tabs-mode nil) ; only use spaces

;; Turn "yes or no" questions into "y or n" questions.
(fset 'yes-or-no-p 'y-or-n-p)

;; Open unidentified files in text mode
(setq-default default-major-mode 'text-mode)

; Work with .gz modes
(auto-compression-mode t)

;; Display the column and line number in the mode line
(column-number-mode t)(line-number-mode t)

;; Save real-estate when not running in X
(menu-bar-mode (if window-system 1 -1))

;; Turn on highlight parens helpfulness
(show-paren-mode t)
(setq-default blink-matching-paren t)

;; I like diff to look a certain way
(setq-default diff-switches "-u")

;; In X, have the mouse avoid blocking the cursor
(mouse-avoidance-mode 'exile)

;; Mouse yank (paste) commands operate at the cursor instead
;; of where you clicked.
(setq-default mouse-yank-at-point t)

;; Disable overwrite mode - it's annoying.
(put 'overwrite-mode 'disabled t)

;; Enable nifty commands
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Use the X Clipboard instead of X Primary (aka middle mouse click)
;; Dunno if I like this...
;(setq x-select-enable-clipboard t)
(setq x-select-enable-clipboard nil)

;; Set the title bar to show filename or buffer name
;; See mode-line-format for format
(setq-default frame-title-format
              '(buffer-file-name "%f (emacs)" ("%b (emacs)")))

;; Popup the SpeedBar in any windowed system
;(when window-system ; (speedbar 1))

;; Install the mouse wheeling stuff
(condition-case err
    (if (load "mwheel" t) (mwheel-install))
  (error
   (message " WARN: Cannot install mouse wheel code %s" (cdr err))
   ))

;; Add the final newline, darn it.
(setq require-final-newline t)

;; Should more blank lines (newlines) be added if you try to scroll past the
;; end of a buffer?
(setq next-line-add-newlines nil)

;; Show you your keystrokes quickly
(setq echo-keystrokes 0.2)

;; Turn on highlighting regions (between point and mark) and other features
(when (not (featurep 'xemacs))
  (transient-mark-mode 1))

;; This lets a region be replaced by a kill-and-yank
(delete-selection-mode 1)

;; TODO
;; * some sort of TODO finding mode

;; EOF
