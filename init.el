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

(setq-default term-scroll-to-bottom-on-output t)
;; Smooth scrolling
(setq scroll-step 1)

;; Show the column number on the status bar
(setq column-number-mode t)

;; Disable backfiles (those with ~)
(setq make-backup-files nil)

;; Not working at the moment!
;; (setq explicit-shell-file-name "/bin/bash")

;; Editing ;;

;; Go evil!
;; (require 'evil)
(evil-mode 1)
(evil-set-initial-state 'ibuffer-mode 'motion)
(evil-set-initial-state 'dired-mode 'motion)

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

(global-set-key (kbd "C-x C-b") 'ibuffer)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))
(global-set-key (kbd "C-<SPC>") 'dabbrev-completion)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (molokai)))
 '(custom-safe-themes
   (quote
	("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default)))
 '(package-selected-packages (quote (markdown-mode evil-commentary evil go-mode)))
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 105 :width normal)))))
