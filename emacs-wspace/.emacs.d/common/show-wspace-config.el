;; Show Whitespace

	;; tab example
;; whitespace example with non-breaking space   
;;    hard-space example

;; Non-breaking Spaces
;(set-face-background  'pesche-hardspace "Gold")
;(add-hook 'font-lock-mode-hook 'highlight-hard-spaces)

;; Tab Characters
(add-hook 'font-lock-mode-hook 'highlight-tabs)
(set-face-background 'pesche-tab nil)
(set-face-underline-p 'pesche-tab "#248")

;; Trailing white-space
(set-face-background  'pesche-space nil)
(set-face-underline-p 'pesche-space "#cd0")
(add-hook 'font-lock-mode-hook 'highlight-trailing-whitespace)
