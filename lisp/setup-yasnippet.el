

;;; Code:


(require 'yasnippet)
(yas-global-mode 1)


(setq yas-snippet-dirs
      '("~/.cookiemacs/snippets"                 ;; personal snippets
        "~/.cookiemacs/snippets-yas"
        ;; "/home/jdt/.emacs.d/elpa/yasnippet-20161110.1226/snippets"           ;; foo-mode and bar-mode snippet collection
	))

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.



(provide 'setup-yasnippet)

;;; setup-yasnippet.el ends here
