

;;; Code:

(require 'package)
(require 'use-package)

(package-initialize)
(message "Loading Cookiemacs Packages from cookiemacs-packages.el")

(defconst cookiemacs-packages
          '(;;ac-slime
             ace-jump-mode
             adoc-mode
             anzu
             autopair
             ;; auto-complete
             auto-yasnippet
	     base16-theme
             better-defaults
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
             company-irony
	     company-quickhelp
	     company-statistics
             company-ycmd
	     cyberpunk-theme
	     deft
             dired+
             dired-details
             dired-details+
             dired-single
             elfeed
             enh-ruby-mode
             evil
	     exec-path-from-shell
             flycheck
	     flycheck-ycmd
             flycheck-rust
             flymake-jshint
             ggtags
             git
             git-gutter-fringe
             graphviz-dot-mode
             helm
             helm-config
             ;;ido-ubiquitous
             inf-ruby
             irony
             js2-mode
             keychain-environment
             lispy
             magit
             markdown-mode
             multiple-cursors
             muse
             neotree
             org
             org-fstree
             org-cliplink
             org-pdfview
	     ox-latex
	     ox-html
	     ox-ascii
	     ox-pandoc
             pdf-tools
             paredit
	     paradox
             racer
             redo+
             restclient
             ;; rtags
             rust-mode
             simple-httpd
             smart-mode-line
             smart-tabs-mode
	     smart-tab
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
	     highlight-symbol
	     linum-relative

             ))

(message "cookiemacs packages selected...")

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; install required
(dolist (package cookiemacs-packages)
  (unless (package-installed-p package)
    (ignore-errors
      (package-install package))))

(message "Package Installation Check complete")

;; ;; upgrade installed
;; (save-window-excursion
;;     (package-list-packages t)
;;       (package-menu-mark-upgrades)
;;         (condition-case nil
;;                   (package-menu-execute t)
;;               ;;(error
;; 	  ;;(package-menu-execute))
;; 	  ))

;; (message "Package Upgrade check complete")

(provide 'cookiemacs-packages)

;;; cookiemacs-packages.el ends here
