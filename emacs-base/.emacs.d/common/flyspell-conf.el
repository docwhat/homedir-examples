;; FlySpell configuration
;; code lovingly borrowed from Fabrice Niessen at
;;       http://www.mygooglest.com/fni/dot-emacs.html
;; This code is GPL v2 licensed.

;; `flyspell-auto-correct-word' is bound to `C-.'
;; Press it one time to correct the word under the cursor.
;; If several spellings are possible, they appear in the minibuffer. Just
;; keep hitting `C-.' to replace the word with the successive suggestions.

;; on-the-fly spelling checking
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checking" t)

;; don't consider that a word repeated twice is an error
(setq flyspell-mark-duplications-flag nil)

;; enable the likeness criteria
(setq flyspell-sort-corrections nil)

;; don't use `M-TAB' to correct word (only use `C-.')
(setq flyspell-use-meta-tab nil)

;; dash character (`-') is considered as a word delimiter
(setq flyspell-consider-dash-as-word-delimiter-flag t)

(defun my-turn-on-flyspell ()
      "Unconditionally turn on flyspell-mode and call `flyspell-buffer'."
      (interactive)
      (flyspell-mode 1)
      (flyspell-buffer))

;; turn on `flyspell' when changing a buffer which is unmodified
(defvar my-flyspell-major-mode-list
  '(html-mode
    latex-mode
    message-mode
    nxml-mode
    text-mode))
(add-hook 'first-change-hook
          #'(lambda ()
              (when (and (memq major-mode my-flyspell-major-mode-list)
                         (not flyspell-mode))
                (my-turn-on-flyspell))))

;; flyspell comments and strings in programming modes
;; (preventing it from finding mistakes in the code)
(add-hook 'autoconf-mode-hook     'flyspell-prog-mode)
(add-hook 'autotest-mode-hook     'flyspell-prog-mode)
(add-hook 'c++-mode-hook          'flyspell-prog-mode)
(add-hook 'c-mode-hook            'flyspell-prog-mode)
(add-hook 'cperl-mode-hook        'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook   'flyspell-prog-mode)
(add-hook 'makefile-mode-hook     'flyspell-prog-mode)
(add-hook 'nxml-mode-hook         'flyspell-prog-mode)
(add-hook 'python-mode-hook       'flyspell-prog-mode)
(add-hook 'sh-mode-hook           'flyspell-prog-mode)
(add-hook 'ruby-mode-hook         'flyspell-prog-mode)
(add-hook 'c-mode-common-hook     'flyspell-prog-mode t)
(add-hook 'java-mode-common-hook  'flyspell-prog-mode t)

;; spell-check your XHTML
(eval-after-load "flyspell"
  '(progn
     (add-to-list 'flyspell-prog-text-faces 'nxml-text-face)))
