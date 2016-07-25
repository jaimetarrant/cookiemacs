
;;; Code:

(message "Loading Muse Configurations")

(require 'muse-mode)     ; load authoring mode

(require 'muse-html)     ; load publishing styles I use
(require 'muse-latex)
(require 'muse-texinfo)
(require 'muse-docbook)

(require 'muse-project)  ; publish files in projects

(setq muse-project-alist
      '(("Website" ("~/dev/cookiesystems/site" :default "index")
	 (:base "html" :path "~/public_html"))
	(("Projects" ("~/Projects" :default "index")
	  (:base "xhtml"
		 :path "~/public_html/projects"
		 :exclude "/private")
	  (:base "pdf"
		 :path "~/public_html/projects/pdf"
		 :exclude "/private")))
	("Plans" ("~/doc/plans"
		  :default "TaskPool"
		  :major-mode planner-mode
		  :visit-link planner-visit-link)
	 (:base "planner-xhtml"
		:path "~/public_html/plans"))))




(provide 'muse-config)

;;; muse-config.el ends here
