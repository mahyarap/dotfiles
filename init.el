(server-start)
;; Emacs package archives to get plugins and themes
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
						 ("melpa" . "https://melpa.org/packages/")
						 ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;; Custom path to load user's themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Remove annoying UIs
;; (setq inhibit-startup-message t)
;; (menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Start Emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Use shift + arrow keys to switch windows
(windmove-default-keybindings)

(setq ibuffer-saved-filter-groups
	  (quote (("default"
			   ("term" (mode . term-mode))
			   ("dired" (mode . dired-mode))
			   ("planner" (or
						   (name . "^\\*Calendar\\*$")
						   (name . "^diary$")
						   (mode . muse-mode)))
			   ("emacs" (name . "^\\*"))
			   ("gnus" (or
						(mode . message-mode)
						(mode . bbdb-mode)
						(mode . mail-mode)
						(mode . gnus-group-mode)
						(mode . gnus-summary-mode)
						(mode . gnus-article-mode)
						(name . "^\\.bbdb$")
						(name . "^\\.newsrc-dribble")))))))
(add-hook 'ibuffer-mode-hook
		  (lambda ()
			(ibuffer-switch-to-saved-filter-groups "default")))
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-expert t)

(setq-default term-scroll-to-bottom-on-output t)

(global-auto-revert-mode t)

;; Smooth scrolling
(setq scroll-step 1)

;; Show the column number on the status bar
(setq column-number-mode t)

;; Disable backfiles (those with ~)
(setq make-backup-files nil)

;; Not working at the moment!
;; (setq explicit-shell-file-name "/bin/bash")

;; Python
(setq-default python-shell-interpreter "python3")

;; Editing ;;

;; Go evil!
;; (require 'evil)
(evil-mode 1)
(evil-set-initial-state 'ibuffer-mode 'motion)
(evil-set-initial-state 'dired-mode 'motion)

;; Flycheck
(global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq-default flycheck-python-pycompile-executable "python3")
;; Remove RET and SPC key binding from Evil's motion state map
(defun my-move-key (keymap-from keymap-to key)
  "Moves key binding from one keymap to another, deleting from the old location. "
  (define-key keymap-to key (lookup-key keymap-from key))
  (define-key keymap-from key nil))
(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
(my-move-key evil-motion-state-map evil-normal-state-map " ")

(evil-set-initial-state 'term-mode 'emacs)

;; Enable auto-closing delimiters
(electric-pair-mode 1)

;; Comment stuff out
(evil-commentary-mode)

(setq c-default-style '((java-mode . "java")
						(awk-mode . "awk")
						(other . "linux")))
(setq-default c-basic-offset 4
			  tab-width 4)

(setq-default fill-column 80)
(add-hook 'text-mode-hook 'auto-fill-mode)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(add-hook 'html-mode-hook
		  (lambda ()
			;; Default indentation is usually 2 spaces, changing to 4.
			(setq indent-tabs-mode nil)
			(set (make-local-variable 'sgml-basic-offset) 2)))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))
(global-set-key (kbd "C-<SPC>") 'dabbrev-completion)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes
   (quote
	("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default)))
 '(package-selected-packages
   (quote
	(yaml-mode fic-mode flycheck markdown-mode evil-commentary evil go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 105 :width normal)))))
