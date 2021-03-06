
;;; Package --- CookieMacs config

;;; Commentary:
;;
;; Cookiemacs Configuration

;;; Code:

(message "Initialisating Cookiemacs Configurations")
(require 'cl)
(require 'use-config)
(require 'cookiemacs-packages)
(require 'jdt-tweaks)
(require 'better-defaults)
(require 'anzu-config)
(require 'adoc-mode)
;;(require 'ido-config)
(require 'helm)
(require 'helm-setup)
(require 'company-config)
(require 'neotree-config)
(require 'restclient)
;; (require 'lispy-config)
(require 'ielm)
(require 'smex-config)
(require 'org)
;; (require 'config-org)
(require 'org-config)
(require 'init-recentf)
(require 'tradexpress-mode)
;; (require 'cedet-config)
(require 'ggtags-config)
(require 'multiple-cursors-config)
(require 'paredit-config)
(require 'muse-config)
(require 'tramp)
(require 'deft-config)
(require 'bbdb-config)
(require 'cyberpunk-theme)
(require 'setup-slime)
(require 'setup-highlight-symbol)

(require 'linum-relative)
(require 'setup-yasnippet)

(use-config config-org)
(use-config config-path)

;; (require 'evil)

(load "/home/jdt/quicklisp/clhs-use-local.el" t)

(setq browse-url-firefox-program "firefox")

(linum-relative-on)
;; (evil-mode 1)
(global-flycheck-mode t)
(add-hook 'after-init-hook 'global-company-mode)
;; (ac-config-default)

(setq delete-old-versions t)

(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Configure File modes.

(add-to-list 'auto-mode-alist '("\\.org\\?" . org-mode))

(provide 'cookiemacs-config)

;;; cookiemacs-config ends here
