
;; not done
 (defconst system-short-name
   (let* ((sys-name (system-name))
          (per-match (string-match "\\." sys-name)))
     (if (not per-match)
         sys-name
       (substring sys-name 0 per-match)
       )
     )
   )
