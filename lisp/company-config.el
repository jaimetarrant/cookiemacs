

(require 'company)
(require 'company)
(require 'company-c-headers)
(require 'company-clang)
(require 'company-lua)
(require 'company-inf-ruby)
(require 'company-restclient)
(require 'company-racer)
(require 'company-shell)

(add-hook 'global-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-clang)

(provide 'company-config)
