;;; elisp-load-dir.el -- Elisp Load Directory

;; Copyright (C) 1998 Len Budney <lbudney@pobox.com>
;; Author:       Len Budney
;; Created:      1998
;; Modified:     2004 by Igor Rayak <osigor@cs.huji.ac.il>

;; Maintainer: Igor Rayak <osigor@cs.huji.ac.il>
;; Keywords: elisp load conf
;; URL: http://www.cs.huji.ac.il/support/emacs/src/lisp/elisp-load-dir.el
;; Revision: $Id: elisp-load-dir.el,v 1.4 2004/07/22 15:15:30 osigor Exp $

;; This file is *NOT* part of GNU emacs

;; This program is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2 of the License, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
;; for more details.
;; 
;; You should have received a copy of the GNU General Public License along
;; with GNU Emacs.  If you did not, write to the Free Software Foundation,
;; Inc., 675 Mass Ave., Cambridge, MA 02139, USA.

;;; Commentary:

;; Description
;;
;; Sometimes you need to load all lisp files (modules) stored in common
;; directory. This library makes that easy.
;;
;; Installation:
;;
;; Install elisp-load-dir.el somewhere on your load path.
;; Add the line:
;;        (load-library elisp-load-dir)
;; or just
;;        (require 'elisp-load-dir)
;; to your .emacs file.  This makes available the following functions:
;;
;;    directory-elisp-files (DIR)    -- List elisp files in DIR
;;    elisp-load-dir (DIR)           -- Load each elisp library in DIR
;;
;; Usage:
;; 
;; To modularize your .emacs file, create a directory (for example
;; "~/.elisp/load").  Put your initialization routines in that directory,
;; in separate elisp files.  You may byte-compile those files if you
;; wish.
;;
;; In your .emacs file, place the lines:
;;
;;         (load-library "elisp-load-dir")
;;         (elisp-load-dir "~/.elisp/load") ;; Rest of initialization here
;;
;; Now, for example, you can initialize variables and do other
;; miscellaneous setup in your .emacs file.  Large bodies of related
;; code, however, can be stored in a file in ~/.emacsinit.  Changing
;; your initialization is a matter of adding or removing files from
;; that directory.

;;; Change Log:
;; $Log: elisp-load-dir.el,v $
;; Revision 1.4  2004/07/22 15:15:30  osigor
;; style fixed
;;

;;; Code:

(defconst elisp-load-dir-revision
  (let ((rcs-rev "$Revision: 1.4 $"))
    (condition-case err
        (save-match-data
          (string-match "Revision: \\([0-9]+\\.[0-9]+\\)" rcs-rev)
          (substring rcs-rev (match-beginning 1) (match-end 1)))
      ('error rcs-rev)))
  "Revision number of `elisp-load-dir' library.")

(defvar eload-dir nil
   "The directory to load all elisp files.")

;;;###autoload
(defun directory-elisp-files (dirname)
  "List files in a directory `DIRNAME' which are elisp files.
This listing is based on extensions of the files (some.el).  Returns a list of
files without extensions, ready to be supplied to the `load-library' command."
  (interactive "DDirectory name: ")
  (setq eload-dir
	(file-name-as-directory(expand-file-name dirname)))
  (let
      ((dirfiles (directory-files dirname ))
       elispfiles curfile)
    (while dirfiles
      (setq curfile (car dirfiles))
      (if
   (and
    (string-match "^\\(.*\\)\\.\\(el\\|elc\\)$" curfile)
    (not (member
   (substring curfile
       (match-beginning 1)
       (match-end 1))
   elispfiles)))
   (setq elispfiles (cons
       (substring curfile
           (match-beginning 1)
           (match-end 1))
       elispfiles)))
      (setq dirfiles (cdr dirfiles)))
    elispfiles))


;;;###autoload
(defun elisp-load-dir (dir)
  "Load all files in a directory `DIR' which are elisp files.
Return value is always nil."
  (interactive "DDirectory name: ")
  (let
      ((libraries (directory-elisp-files dir)) curlib)
    (while libraries
      (setq curlib (car libraries))
      (load (concat eload-dir curlib))
      (setq libraries (cdr libraries)))))


(provide 'elisp-load-dir)

;;; elisp-load-dir.el ends here
