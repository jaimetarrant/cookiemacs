
(set-variable 'ycmd-server-command '("/bin/python" "-u" "/home/jdt/dev/ycmd/ycmd/ycmd/." "--options_file=/home/jdt/dev/ycmd/ycmd/ycmd/default_settings.json"))

(require 'company)
(require 'company-c-headers)
(require 'company-clang)
(require 'company-lua)
(require 'company-inf-ruby)
(require 'company-restclient)
(require 'company-racer)
(require 'company-shell)

(require 'ycmd)
(require 'company-ycmd)

(add-hook 'global-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-clang)

(add-hook 'after-init-hook #'global-ycmd-mode)

(require 'flycheck-ycmd)

;; Make sure the flycheck cache sees the parse results
(add-hook 'ycmd-file-parse-result-hook 'flycheck-ycmd--cache-parse-results)

;; Add the ycmd checker to the list of available checkers
(add-to-list 'flycheck-checkers 'ycmd)

(add-hook 'ycmd-mode-hook 'company-ycmd-setup)
(add-hook 'ycmd-mode-hook 'flycheck-ycmd-setup)

(global-company-mode)
(global-ycmd-mode)


(provide 'company-config)
