
;;; Code: 

;; Make sure emacs knows who I am
(setq user-full-name "Jaime Tarrant")
(setq user-mail-address "jdt@cookiesystems.com")

;; Enable backup files.
(setq make-backup-files t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Enable versioning with default values (keep five last versions, I
;; think!)
(setq version-control t)
(recentf-mode t)

(setq gc-cons-threshold 100000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; Configure the UI.

(menu-bar-mode -1)
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(blink-cursor-mode -1)
(line-number-mode t)
(global-linum-mode t)
(electric-indent-mode -1)

(global-set-key (kbd "s-/") 'search-forward)

;; UTF-8
(setq locale-coding-system 'utf-8)
(prefer-coding-system       'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


(setq buffer-file-coding-system 'utf-8)

;; From Emacs wiki
;; (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(setq-default auto-indent-mode t)
(delete-selection-mode t)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; flyspell-mode does spell-checking on the fly as you type
(require 'flyspell)

(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))


;; whitespace-mode config
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face tabs empty trailing lines-tail))

(require 'windmove)
(windmove-default-keybindings)

(defun compile-tags ()
  "compile etags for the current project"
  (interactive)
  (compile "find . -name \"*.[chCH]\" -print | etags -"))

(defun launch (command)
  "Launch an application from Emacs, with its own output
buffer. This is like asynch-shell-command but allows for any
number of processes at a time, rather than just one. If given a
prefix argument, the process's buffer is displayed."
  (interactive (list (read-shell-command (concat default-directory "$ "))))
  (let* ((name (car (split-string-and-unquote command)))
         (buffer (generate-new-buffer (concat "*" name "*"))))
    (set-process-sentinel (start-process-shell-command name buffer command)
                          'launch-sentinel)
    (if (eq (car current-prefix-arg) 4)
        (display-buffer buffer))))

(defun launch-sentinel (proc event)
  "Reports on changes in `launch'ed applications."
  (message (format "%s: %s" proc event)))

(global-set-key (kbd "s-x") 'launch)

(message "jdt-tweaks loaded...")

(provide 'jdt-tweaks)

;;; jdt-tweaks.el ends here
