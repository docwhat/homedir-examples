;; turn on font-lock aka syntax highlighting on all modes that handle it.
(if (fboundp 'global-font-lock-mode) ; if available
    (global-font-lock-mode 3))

;; Highlight incremental search
(setq search-highlight t)

