(require 'package)

 
; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(defvar package-list '(better-defaults
                       cider
                       clojure-mode
                       clojure-test-mode
                       auto-complete
                       ac-nrepl
                       popup
                       mic-paren
                       rainbow-delimiters
                       rainbow-mode
                       paredit
                       idle-highlight-mode
                       ido-ubiquitous
                       find-file-in-project
                       magit
                       smex
                       scpaste))

(package-initialize)

(dolist (p package-list)
  (when (not (package-installed-p p))
    (package-install p)))

(setq inhibit-splash-screen t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load-theme 'solarized-dark)


(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key (kbd "C-;") 'toggle-comment-on-line)


(require 'rainbow-delimiters)
(require 'paredit)
(require 'clojure-mode)

(defun lisp-minor-modes ()
  (paredit-mode)
  (rainbow-delimiters-mode)
  (paren-activate)
  )

(add-hook 'clojure-mode-hook 'lisp-minor-modes)
(add-hook 'emacs-lisp-mode-hook 'lisp-minor-modes)
