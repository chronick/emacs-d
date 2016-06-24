;; Hello Emacs.
(require 'package)

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Load and activate packages
(package-initialize)

;; Auto Update
(when (not package-archive-contents)
  (package-refresh-contents))


(defvar package-list '(better-defaults ; because why not
                       paredit ; an elegant weapon, for a civilized age
                       clojure-mode ; dragon as fuck
                       clojure-mode-extra-font-locking ; better clojure syntax highlighting
                       cider ; Clojure REPLs
                       auto-complete ;)
                       ac-nrepl ; nrepl integrations for auto-complete
                       smex ; M-x on steroids
                       projectile ; project navigation
                       rainbow-delimiters ; colorful parentheses
                       clojure-test-mode ; boring but useful
                       auto-complete ; gotta have that
                       popup ; instead of minibuffering everything
                       mic-paren ; highlights the other paren
                       rainbow-mode ; shows colors
                       idle-highlight-mode ; highlight other occurances of a word
                       ido-ubiquitous ; ido in all the things
                       find-file-in-project ; searches project for file
                       magit ; git shit
                       sublimity ; smooth scrolling and sublime-style minimap
                       exec-path-from-shell ; get that sweet juicy env
                       color-theme-sanityinc-solarized
                       neotree ; file tree browser
                       markdown-mode))


;; install the packages defined above, if they're not installed already.
(dolist (p package-list)
  (when (not (package-installed-p p))
    (package-install p)))

;; Dont show that dumb emacs intro
(setq inhibit-splash-screen t)

;; Somehow this needs to be here to use custom color schemes.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" default)))
 '(safe-local-variable-values (quote ((checkdoc-minor-mode . t) (mangle-whitespace . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; helper functions
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defun config ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun lisp-minor-modes ()
  (paredit-mode)
  (rainbow-delimiters-mode)
  (paren-activate)
 )

(global-linum-mode t)
;(sublimity-mode 1)

; Hooks
(add-hook 'clojure-mode-hook 'lisp-minor-modes)
(add-hook 'emacs-lisp-mode-hook 'lisp-minor-modes)
(add-hook 'shell-mode-hook 'shell-stuff)

; keybindings
(global-set-key (kbd "C-;") 'toggle-comment-on-line)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-x") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "C-j") 'cider-eval-print-last-exp)

(add-to-list 'exec-path (concat (getenv "HOME") "/bin"))

(setenv "PATH" (concat (getenv "PATH") ":" (concat (getenv "HOME") "/bin" )))
;;;;
;; Customization
;;;;

;; Add a directory to our load path so that when you `load` things
;; below, Emacs knows where to look for the corresponding file.
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

(load "repl.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
