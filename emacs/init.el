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

;; Display line numbers in prog-mode
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Set faces
(set-face-attribute 'default nil
  :font "Iosevka"
  :height 140
  :weight 'light)

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

(use-package modus-themes
  :config
  (load-theme 'modus-vivendi-tinted t))

;; evil-mode
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

;; company-mode
;; TODO: bind space for ignoring highlighting
(use-package company
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(add-hook 'after-init-hook 'global-company-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-p") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))			


;; lsp-ui
;; How to make better use of this ?
(use-package lsp-ui
  :init
  (setq lsp-ui-code-doc-enable t)
  (setq lsp-ui-sideline-enable t)
  )

;; lsp mode
(use-package lsp-mode
  :init
  (setq lsp-headerline-breadcrumb-enable nil)
  :hook(
		(c-mode . lsp)
		(c++-mode . lsp)
		)
  :commands lsp)
  
;; Modeline

(setq-default mode-line-format
  '("%e"
	mode-line-front-space	
	" "
	mode-line-modified
	" "
    mode-line-buffer-identification
	mode-line-position
	" "
	vc-mode
	" "
	mode-name
	mode-line-end-spaces))











(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "#7F9F7F" :slant italic)))))
