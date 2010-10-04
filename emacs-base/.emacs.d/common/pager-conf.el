;; Pager fixes the weird scrolling behaviour in emacs
;; Giving more control over movement

(global-set-key '[C-v]          'pager-page-down)
(global-set-key '[next]         'pager-page-down)

(global-set-key '[M-v]          'pager-page-up)
(global-set-key '[A-v]          'pager-page-up)
(global-set-key '[prior]        'pager-page-up)

(global-set-key '[up]           'pager-row-up)
;(global-set-key '[C-p]          'pager-row-up)
;(global-set-key "\C-p"          'pager-row-up)
(global-set-key '[kp-8]         'pager-row-up)
(global-set-key '[kp-up]        'pager-row-up)

(global-set-key '[down]         'pager-row-down)
;(global-set-key '[C-n]          'pager-row-down)
;(global-set-key "\C-n"          'pager-row-down)
(global-set-key '[kp-2]         'pager-row-down)
(global-set-key '[kp-down]      'pager-row-down)

