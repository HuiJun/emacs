;; Move Backup and Autosave files
(defvar user-temporary-file-directory "~/.emacs.d/backup/")
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t
      backup-directory-alist `(("." . ,user-temporary-file-directory) (tramp-file-name-regexp nil))
      auto-save-list-file-prefix (concat user-temporary-file-directory ".auto-saves-")
      auto-save-file-name-transforms `((".*" ,user-temporary-file-directory t)))
