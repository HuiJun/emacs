(tool-bar-mode 0)
(setq inhibit-splash-screen t)
(setq-default truncate-lines 1)
(setq warning-minimum-level :error)
(global-linum-mode 1)

;; Move Backup and Autosave files
(defvar user-temporary-file-directory
  "~/.emacs.d/backup/")
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; Load Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'solarized-dark t)

;; Load Theme in every new frame
(defun thj-reload-solarized (frame)
  (select-frame frame)
  (load-theme 'solarized-dark t))
(defun thj-reload-solarized-on-delete (&optional frame)
    (load-theme 'solarized-dark t))
(add-hook 'delete-frame-functions 'thj-reload-solarized-on-delete)
(add-hook 'server-done-hook 'thj-reload-solarized-on-delete)
(add-hook 'after-make-frame-functions 'thj-reload-solarized)

;; Set Tabs and Font
(set-default-font "Terminus-12")
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default indent-line-function 'insert-tab)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; Try to format indentation for yanks
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

;; Format Arrays in php-mode
(add-hook 'php-mode-hook (lambda ()
                           (defun ywb-php-lineup-arglist-intro (langelem)
                             (save-excursion
                               (goto-char (cdr langelem))
                               (vector (+ (current-column) c-basic-offset))))
                           (defun ywb-php-lineup-arglist-close (langelem)
                             (save-excursion
                               (goto-char (cdr langelem))
                               (vector (current-column))))
                           (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
                           (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

;; Start nXhtml
(load "~/.emacs.d/nxhtml/autostart.el")
(load "~/.emacs.d/lisp/mumamo-workaround.el")
(setq mumamo-background-colors nil)

;; Load autocomplete
(add-to-list 'load-path "~/.emacs.d/autocomplete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/autocomplete//ac-dict")
(ac-config-default)

;; Load flymake
(require 'flymake)
(add-hook 'find-file-hook 'flymake-mode)

;; Load Midnight
(require 'midnight)
(midnight-delay-set 'midnight-delay 3600)


(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key "\C-cx" 'close-all-buffers)

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
