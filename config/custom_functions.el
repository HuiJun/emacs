;; Close all buffers function
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; Remove DOS EOL
(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(add-hook 'text-mode-hook 'remove-dos-eol)
(add-hook 'web-mode-hook 'remove-dos-eol)
(add-hook 'conf-mode-hook 'remove-dos-eol)

