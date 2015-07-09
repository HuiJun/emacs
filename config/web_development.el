(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'php-mode)
(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Load flymake
(require 'flymake)
(add-hook 'find-file-hook 'flymake-mode)
