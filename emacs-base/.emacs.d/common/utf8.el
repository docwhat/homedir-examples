;;; Setup the encoding and input methods to make UTF8 work best
;;  stolen from -- http://linux.seindal.dk/item32.html

(condition-case err
    (progn
      (set-language-environment               'UTF-8)
      (set-default-coding-systems             'utf-8)
      (setq locale-coding-system              'utf-8)
      (setq default-buffer-file-coding-system 'utf-8)
      (Setq file-name-coding-system           'utf-8)
      (set-buffer-file-coding-system          'utf-8)
      (set-terminal-coding-system             'utf-8)
      (set-keyboard-coding-system             'utf-8)
      (set-selection-coding-system            'utf-8)
      (set-clipboard-coding-system            'utf-8)
      (prefer-coding-system                   'utf-8)
      )
  (error (message "Unable to support UTF-8"))
)

;; Detect endianness of UTF-16 containing a Byte Order Mark, e.g. U+FEFF
;; Detect EOL mode by looking for CR/LF on the first line
(add-to-list 'auto-coding-regexp-alist '("^\xEF\xBB\xBF" . utf-8) t)
(add-to-list 'auto-coding-regexp-alist '("^\xFF\xFE.*\x0D\x00$" . utf-16-le-dos) t)
(add-to-list 'auto-coding-regexp-alist '("^\xFE\xFF.*\x0D\x00$" . utf-16-be-dos) t)
(add-to-list 'auto-coding-regexp-alist '("^\xFF\xFE" . utf-16-le) t)
(add-to-list 'auto-coding-regexp-alist '("^\xFE\xFF" . utf-16-be) t)

;; work around for some cut-and-paste bugs
;;  Note: this only runs if the variables and stuff exist already.
(condition-case nil
    (progn x-select-request-type
      (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
  (void-variable nil)
)
(setq x-select-enable-clipboard t)
(condition-case nil
    (progn (x-cut-buffer-or-selection-value)
           (setq interprogram-paste-function 'x-cut-buffer-or-selection-value))
  (void-function nil)
)
;; Christian Höltje

;;;; UTF-8 Tips ;;;;
;; You have to specify the coding system already when loading the
;; file, like with
;;
;;  C-x RET c utf-8 RET C-x C-f crap.reg RET
;;
;; If you already loaded the file, you need to reload:
;;
;; C-x RET c utf-8 RET C-x C-v RET

(condition-case nil
    ;; See C-h I for help about this input mode
    ;; not present in all emacsen
    (set-input-method 'TeX)
  (error nil)
)
