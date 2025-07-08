(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))

(require 'package)
(add-to-list 'package-archives '(melpa . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fec5c912ae88d062ef2225f2552641759e9fa4c221a25f5210aae1fcc52f7c6f"
     default))
 '(package-selected-packages '(## company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
