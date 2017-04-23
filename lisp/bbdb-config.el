
;;; Code:

(require 'bbdb)


(bbdb-initialize 'gnus 'message) 
(setq bbdb-file "~/j/bbdb")
(setq bbdb-north-american-phone-numbers-p nil)
(setq bbdb-send-mail-style 'gnus)
(bbdb-insinuate-message)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)

(setq bbdb-complete-name-full-completion t)
(setq bbdb-completion-type 'primary-or-name)
(setq bbdb-complete-name-allow-cycling t)

(setq
 bbdb-offer-save 1
 bbdb-use-pop-up t
 bbdb-electric-p t
 bbdb-popup-target-lines  1)


(bbdb-mua-auto-update-init 'message) 
(setq bbdb-mua-auto-update-p 'query) 

(provide 'bbdb-config)
;;; bbdb-config.el ends here
