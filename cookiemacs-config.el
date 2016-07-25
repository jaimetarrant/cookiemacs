
;;; Package --- CookieMacs config

;;; Commentary:
;;
;; Cookiemacs Configuration

;;; Code:

(message "Initialisating Cookiemacs Configurations")
(require 'cl)

(require 'jdt-tweaks)
(require 'cookiemacs-packages)
(require 'anzu-config)
(require 'ido-config)
(require 'company-config)
(require 'neotree-config)
(require 'restclient)
;; (require 'lispy-config)
(require 'ielm)
(require 'smex-config)
(require 'org)
(require 'tradexpress-mode)
(require 'cedet-config)
(require 'ggtags-config)
(require 'multiple-cursors-config)
(require 'paredit-config)
(require 'muse-config)
(require 'tramp)
(require 'deft-config)
(require 'bbdb-config)

(global-flycheck-mode t)
(add-hook 'after-init-hook 'global-company-mode)
(ac-config-default)

(when (fboundp 'winner-mode)
  (winner-mode 1))

;; Configure File modes.

(add-to-list 'auto-mode-alist '("\\.org\\?" . org-mode))

(provide 'cookiemacs-config)

;;; cookiemacs-config ends here
