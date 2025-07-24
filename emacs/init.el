
(setq inhibit-startup-message t)

;; Disable scroll bar, tool bar and menu bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(set-fringe-mode 10)

(setq visible-bell t)

;; Tabs to spaces
(setq-default indent-tab-mode nil)
(setq-default tab-width 4)

;; Display line numbers in prog-mode
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Set faces
(set-face-attribute 'default nil
  :font "Iosevka"
  :height 150
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

;; theme
(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

;; evil-mode
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

;; company-mode
(use-package company
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-p") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))			















(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil zenburn-theme))
 '(warning-suppress-types '((native-compiler) (native-compiler))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "#7F9F7F" :slant italic)))))
