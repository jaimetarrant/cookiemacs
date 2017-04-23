
;;; Code:

;;; Commentary:

(require 'org)
(require 'org-agenda)
(require 'org-fstree)
(require 'org-cliplink)

(setq org-alphabetical-lists t)

;; Explicitly load required exporters
(require 'ox-html)
(require 'ox-latex)
(require 'ox-ascii)
(require 'ox-pandoc)


(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; Lots of stuff from http://doc.norang.ca/org-mode.html

(setq org-plantuml-jar-path "/bin/plantuml.jar")

(add-hook 'org-babel-after-execute-hook 'jdt/display-inline-images 'append)

; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun jdt/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         ;; (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

(setq org-latex-listings t)

; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))


; Latex Class

(add-to-list 'org-latex-classes
             '("jdt-org-article"
               "\\documentclass{article}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{hyperref}
\\usepackage{natbib}
\\usepackage{amssymb}
\\usepackage{amsmath}
\\usepackage{geometry}
\\geometry{a4paper,left=2.5cm,top=2cm,right=2.5cm,bottom=2cm,marginparsep=7pt, marginparwidth=.6in}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(define-minor-mode prose-mode
  "Set up a buffer for prose editing.
This enables or modifies a number of settings so that the
experience of editing prose is a little more like that of a
typical word processor."
  nil " Prose" nil
  (if prose-mode
      (progn
        (setq truncate-lines nil)
        (setq word-wrap t)
        (setq cursor-type 'bar)
        (when (eq major-mode 'org)
          (kill-local-variable 'buffer-face-mode-face))
        (buffer-face-mode 1)
        ;;(delete-selection-mode 1)
        (set (make-local-variable 'blink-cursor-interval) 0.6)
        (set (make-local-variable 'show-trailing-whitespace) nil)
        (flyspell-mode 1)
        (when (fboundp 'visual-line-mode)
          (visual-line-mode 1)))
    (kill-local-variable 'truncate-lines)
    (kill-local-variable 'word-wrap)
    (kill-local-variable 'cursor-type)
    (kill-local-variable 'show-trailing-whitespace)
    (buffer-face-mode -1)
    ;; (delete-selection-mode -1)
    (flyspell-mode -1)
    (when (fboundp 'visual-line-mode)
      (visual-line-mode -1))))

;;(add-hook 'org-mode-hook 'buffer-face-mode)


;;; Capturing

(global-set-key (kbd "C-c c") 'org-capture)

;; (setq org-capture-templates
;;       `(("t" "todo" entry (file "")  ; "" => org-default-notes-file
;;          "* NEXT %?\n%U\n" :clock-resume t)
;;         ("n" "note" entry (file "")
;;          "* %? :NOTE:\n%U\n%a\n" :clock-resume t)))

;;; Refiling

(setq org-refile-use-cache nil)

; Targets include this file and any file contributing to the agenda - up to 5 levels deep
; (setq org-refile-targets '((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5)))

(add-to-list 'org-agenda-after-show-hook 'org-show-entry)


;; Targets start with the file name - allows creating level 1 tasks
;;(setq org-refile-use-outline-path (quote file))
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes 'confirm)


;;; To-do settings

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "DELEGATED(e!)" "HOLD(h)" "|" "CANCELLED(c@/!)")))
      org-todo-repeat-to-state "NEXT")

(setq org-todo-keyword-faces
      (quote (("NEXT" :inherit warning)
              ("PROJECT" :inherit font-lock-string-face))))



;;; Agenda views

; (setq-default org-agenda-clockreport-parameter-plist '(:link t :maxlevel 3))


; 
;; (let ((active-project-match "-INBOX/PROJECT"))

;;   (setq org-stuck-projects
;;         `(,active-project-match ("NEXT")))

;;   (setq org-agenda-compact-blocks t
;;         org-agenda-sticky t
;;         org-agenda-start-on-weekday nil
;;         org-agenda-span 'day
;;         org-agenda-include-diary nil
;;         org-agenda-sorting-strategy
;;         '((agenda habit-down time-up user-defined-up effort-up category-keep)
;;           (todo category-up effort-up)
;;           (tags category-up effort-up)
;;           (search category-up))
;;         org-agenda-window-setup 'current-window
;;         org-agenda-custom-commands
;;         `(("N" "Notes" tags "NOTE"
;;            ((org-agenda-overriding-header "Notes")
;;             (org-tags-match-list-sublevels t)))
;;           ("g" "GTD"
;;            ((agenda "" nil)
;;             (tags "INBOX"
;;                   ((org-agenda-overriding-header "Inbox")
;;                    (org-tags-match-list-sublevels nil)))
;;             (stuck ""
;;                    ((org-agenda-overriding-header "Stuck Projects")
;;                     (org-agenda-tags-todo-honor-ignore-options t)
;;                     (org-tags-match-list-sublevels t)
;;                     (org-agenda-todo-ignore-scheduled 'future)))
;;             (tags-todo "-INBOX/NEXT"
;;                        ((org-agenda-overriding-header "Next Actions")
;;                         (org-agenda-tags-todo-honor-ignore-options t)
;;                         (org-agenda-todo-ignore-scheduled 'future)
;;                         ;; TODO: skip if a parent is WAITING or HOLD
;;                         (org-tags-match-list-sublevels t)
;;                         (org-agenda-sorting-strategy
;;                          '(todo-state-down effort-up category-keep))))
;;             (tags-todo ,active-project-match
;;                        ((org-agenda-overriding-header "Projects")
;;                         (org-tags-match-list-sublevels t)
;;                         (org-agenda-sorting-strategy
;;                          '(category-keep))))
;;             (tags-todo "-INBOX/-NEXT"
;;                        ((org-agenda-overriding-header "Orphaned Tasks")
;;                         (org-agenda-tags-todo-honor-ignore-options t)
;;                         (org-agenda-todo-ignore-scheduled 'future)
;;                         ;; TODO: skip if a parent is a project
;;                         (org-agenda-skip-function
;;                          '(lambda ()
;;                             (or (org-agenda-skip-subtree-if 'todo '("PROJECT" "HOLD" "WAITING" "DELEGATED"))
;;                                 (org-agenda-skip-subtree-if 'nottododo '("TODO")))))
;;                         (org-tags-match-list-sublevels t)
;;                         (org-agenda-sorting-strategy
;;                          '(category-keep))))
;;             (tags-todo "/WAITING"
;;                        ((org-agenda-overriding-header "Waiting")
;;                         (org-agenda-tags-todo-honor-ignore-options t)
;;                         (org-agenda-todo-ignore-scheduled 'future)
;;                         (org-agenda-sorting-strategy
;;                          '(category-keep))))
;;             (tags-todo "/DELEGATED"
;;                        ((org-agenda-overriding-header "Delegated")
;;                         (org-agenda-tags-todo-honor-ignore-options t)
;;                         (org-agenda-todo-ignore-scheduled 'future)
;;                         (org-agenda-sorting-strategy
;;                          '(category-keep))))
;;             (tags-todo "-INBOX/HOLD"
;;                        ((org-agenda-overriding-header "On Hold")
;;                         ;; TODO: skip if a parent is WAITING or HOLD
;;                         (org-tags-match-list-sublevels nil)
;;                         (org-agenda-sorting-strategy
;;                          '(category-keep))))
;;             ;; (tags-todo "-NEXT"
;;             ;;            ((org-agenda-overriding-header "All other TODOs")
;;             ;;             (org-match-list-sublevels t)))
;; 	    )))))


(add-hook 'org-agenda-mode-hook 'hl-line-mode)

(define-key org-mode-map (kbd "C-M-<up>") 'org-up-element)

(provide 'org-config)

;;; org-config ends here
