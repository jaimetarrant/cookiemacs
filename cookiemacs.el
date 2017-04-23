
;;; Code:

;; Initialise
;;

(message "Loading cookiemacs ... ")
(message "System type is: %s" system-type)

(setq debug-on-error t)

;; The beginnings of os detection and handling..
;; Figure out if we are on windows or *nix, and where
;; our configuration is supposed to be.

(defvar cookiemacs-root (if (eq system-type 'windows-nt)
  "c:/Users/TARRAJ/AppData/Roaming" "/home/jdt"))

 (add-to-list 'load-path 'cookiemacs-root)

;; Add Common Lisp support
;; (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

;; Package Repositorips
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")))

;; ;; Load Private Settings

;; (let ((cookiemacs-repo-sources (concat cookiemacs-root "/.cookiemacs/private")))
;;   (add-to-list 'load-path cookiemacs-repo-sources)
;;   (dolist (f (directory-files cookiemacs-repo-sources))
;;     (let ((name (concat cookiemacs-repo-sources "/" f)))
;;       (when (and (file-directory-p name)
;;                  (not (equal f ".."))
;;                  (not (equal f ".")))
;;         (add-to-list 'load-path name)))))

;; Check if I am at work and setup the proxy if so.

;; (require 'proxy-settings)

;; Load repo sources - cloned stuff -  config settings

(let ((cookiemacs-repo-sources (concat cookiemacs-root "/.cookiemacs/repo-sources")))
  (add-to-list 'load-path cookiemacs-repo-sources)
  (dolist (f (directory-files cookiemacs-repo-sources))
    (let ((name (concat cookiemacs-repo-sources "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))


;; Load module configurations in cookiemacs-modules
;;

;; (message "Loading: " (concat cookiemacs-root "/.cookiemacs/plugins"))
(let ((cookiemacs-modules (concat cookiemacs-root "/.cookiemacs/lisp")))
  (add-to-list 'load-path cookiemacs-modules)
  (dolist (f (directory-files cookiemacs-modules))
    (let ((name (concat cookiemacs-modules "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(let ((cookiemacs-libs (concat cookiemacs-root "/.cookiemacs/lib/use-config")))
  (add-to-list 'load-path cookiemacs-libs)
  (dolist (f (directory-files cookiemacs-libs))
    (let ((name (concat cookiemacs-libs "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(require 'server)
(message "starting the emacs server...")

;; I cannot get suitable permissions for the emacs server at work
;; So, in that case, use insecure permissions if the host os is windows.

(unless (server-running-p)
  (when (and ( >= emacs-major-version 23)
	     (equal window-system 'w32))
    (defun server-ensure-safe-dir (dir) "Noop" t)
    (server-start)))

(message "emacs server started ...")
(message "loading cookiemacs configuration")
(require 'cookiemacs-config)
(message "cookiemacs initialisation complete! ...")

(provide 'cookiemacs)

;;; cookiemacs.el ends here
