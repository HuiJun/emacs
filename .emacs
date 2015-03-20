(if (display-graphic-p)
    (tool-bar-mode 0)
  (setq visible-bell t))

(setq inhibit-splash-screen t
      initial-scratch-message nil
      warning-minimum-level :error
      uniquify-buffer-name-style 'reverse)

(setq-default truncate-lines 1
              indent-tabs-mode nil
              tab-width 4
              indent-line-function 'insert-tab
              frame-title-format "%b (%f)")

(global-linum-mode 1)

(load "~/.emacs.d/config/backup.el")
(load "~/.emacs.d/config/theme.el")
(load "~/.emacs.d/config/style.el")
(load "~/.emacs.d/config/autocomplete.el")
(load "~/.emacs.d/config/custom_functions.el")
(load "~/.emacs.d/config/web_development.el")
(load "~/.emacs.d/config/keys.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#262626" "#d70000" "#5f8700" "#af8700" "#0087ff" "#af005f" "#00afaf" "#626262"])
 '(background-color nil)
 '(background-mode dark)
 '(cursor-color nil)
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(foreground-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
