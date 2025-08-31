(setq inhibit-startup-message t)

;; Disable scroll bar, tool bar and menu bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(set-fringe-mode 0)

(setq visible-bell t)


;; Tabs to spaces
(setq-default indent-tab-mode nil)
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)


;; Display line numbers in prog-mode
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Set faces
(set-face-attribute 'default nil
  :font "Iosevka"
  :height 140
  :weight 'medium)

;; Had to enable the italic attribute manually (not sure why)
;; -> use M-x list-face-display and navigate to font-lock-comment-face
(set-face-attribute 'font-lock-comment-face nil
   :slant 'italic)


;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

;; term-mode
;; note: to exit term mode use C-c C-j to switch to line mode
(use-package term
  :config
  (setq explicit-shell-file-name "bash"))


;; themes
(use-package zenburn-theme)

(use-package monokai-theme)

(use-package gruber-darker-theme)

(use-package modus-themes)

(use-package nord-theme
  :config
  (load-theme 'nord t))

;; evil-mode
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (evil-define-key 'normal org-mode-map (kbd "<tab>") #'org-cycle))


;; company-mode
(use-package company
  :config
  (setq company-idle-delay 0.5)
  (setq company-minimum-prefix-length 3)
  (define-key company-active-map (kbd "SPC") #'company-abort)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-p") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  :hook
  (prog-mode . company-mode))


;; flycheck
(use-package flycheck
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode))


;; lsp mode
(use-package lsp-mode
  :init
  (setq lsp-headerline-breadcrumb-enable nil)
  :hook
  (c-mode . lsp)
  (c++-mode . lsp)
  :config
  (setq lsp-eldoc-enable-hover t)
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-diagnostic-max-lines 1)
  :commands lsp)
  

;; Nerd-Icons
(use-package nerd-icons)


;; Modeline
;;(setq-default mode-line-format
;;  '("%e"
;;	mode-line-front-space
;;	" "
;;	mode-line-modified
;;	" "
;;  mode-line-buffer-identification
;;	" "
;;	mode-line-position
;;	" "
;;	vc-mode
;;	" "
;;	mode-name
;;	mode-line-end-spaces))

(use-package doom-modeline
  :init (doom-modeline-mode 1))


;; Emacs Dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner 'logo))


;; org-mode
(use-package org)

(add-hook 'org-mode-hook #'org-indent-mode)


;; org-roam
(use-package org-roam
  :config 
  (setq org-roam-directory (file-truename "~/.org/roam"))
  (add-hook 'org-mode-hook #'org-roam-db-autosync-mode))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-clients-clangd-args '("--header-insertion-decorators=0"))
 '(org-agenda-files '("/home/felixkellenbenz/.org/tasks/agenda.org"))
 '(package-selected-packages
   '(all-the-icons company dashboard doom-modeline evil flycheck
				   gruber-darker-theme lsp-ui modus-themes
				   monokai-theme nerd-icons-completion nord-theme
				   org-roam zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "#7F9F7F" :slant italic)))))
