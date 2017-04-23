
;;; Code:

(require 'cc-mode)
(require 'semantic)
(require 'rtags)
(require 'company-rtags)
(require 'rtags-helm)
(setq rtags-use-helm t)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-mode 1)

(defun cookiemacs/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(global-ede-mode 1)                      ; Enable the Project management system

(add-hook 'c-mode-common-hook 'cookiemacs/cedet-hook)
(add-hook 'c-mode-hook 'cookiemacs/cedet-hook)
(add-hook 'c++-mode-hook 'cookiemacs/cedet-hook)

;; Enable EDE only in C/C++

(require 'ede)
(global-ede-mode)

;;; GDB

(setq
 gdb-many-windows t
 gdb-show-main t)

(setq c-default-style "google"
        c-basic-offset 4)
(c-set-offset 'substatement-open 4)


(provide 'cedet-config)

;;; cedet-config.el ends here

