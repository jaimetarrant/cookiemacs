
;;; Code: 

(require 'package)

(package-initialize)
(message "Loading Cookiemacs Packages from cookiemacs-packages.el")

(defconst cookiemacs-packages
      '(ac-slime
        ace-jump-mode
	anzu
        autopair
	auto-complete
        auto-yasnippet
	bbdb-
        color-theme
	;;	common-lisp-snippets
        company
	company-c-headers
	company-lua
	company-inf-ruby
	company-restclient
        company-racer
	company-shell
        deft
        dired+
        dired-details
        dired-details+
        dired-single
        elfeed
        enh-ruby-mode
        flycheck
        flycheck-rust
        flymake-jshint
	ggtags
        git
        git-gutter-fringe
        graphviz-dot-mode
	ido-ubiquitous
	inf-ruby
        js2-mode
        keychain-environment
        lispy
        magit
        markdown-mode
	multiple-cursors
	muse
	neotree
        org
	paredit
        racer
        redo+
        restclient
        rust-mode
        simple-httpd
        smart-mode-line
        smart-tabs-mode
        smartrep
	smex
        tramp
        undo-tree
        use-package
        w3m
        web-mode
        wgrep
        xclip
        xcscope
	yasnippet
	))


; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))


;; install required
(dolist (package cookiemacs-packages)
    (unless (package-installed-p package)
          (ignore-errors
                  (package-install package))))

;; upgrade installed
(save-window-excursion
    (package-list-packages t)
      (package-menu-mark-upgrades)
        (condition-case nil
                  (package-menu-execute t)
              (error
               (package-menu-execute))))



(provide 'cookiemacs-packages)

;;; cookiemacs-packages.el ends here
