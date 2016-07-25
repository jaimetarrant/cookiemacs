
;;; Code:

(require 'ido)
(require 'ido-ubiquitous)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)

;; use ido-ubiquitous

(ido-ubiquitous-mode t)

(provide 'ido-config)

;;; ido-config.el ends here
