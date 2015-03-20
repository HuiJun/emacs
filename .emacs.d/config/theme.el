;; Load Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'solarized-dark t)

;; Theme Functions
(defun thj-reload-solarized (frame) 
  (select-frame frame)
  (load-theme 'solarized-dark t))

(defun thj-reload-solarized-on-delete
  (&optional frame)
  (load-theme 'solarized-dark t))

;; Load Theme in every new frame
(add-hook 'delete-frame-functions 'thj-reload-solarized-on-delete)
(add-hook 'server-done-hook 'thj-reload-solarized-on-delete)
(add-hook 'after-make-frame-functions 'thj-reload-solarized)
