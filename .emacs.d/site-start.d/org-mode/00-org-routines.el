(defun pb/create-org-publish-alist (current-project org-src-path org-publish-path &optional org-publish-function)
  "Create org-publish-alist configuration for LaTeX project."

  (setq current-project-org (concat current-project "-org"))
  (setq current-project-static (concat current-project "-static"))
;;  (if (not org-publish-function) (setq org-publish-function org-latex-publish-to-latex))

  (list `(,current-project-org
	  :base-directory ,org-src-path
	  :publishing-directory ,org-publish-path
	  :base-extension "org"
	  :recursive t
	  :publishing-function org-latex-publish-to-latex
	  :export-with-tags nil
	  :headline-levels 10
	  :with-toc nil
	  :section-numbers t
	  :todo-keywords nil
	  :author nil
	  :creator-info nil
	  :table-auto-headline t
	  :style-include-default t
	  :timestamp f
	  :exclude-tags ("noexport")
	  :auto-preamble t)
	
	`(,current-project-static
	  :base-directory ,org-src-path
	  :publishing-directory ,org-publish-path
	  :recursive t
	  :base-extension "tex\\|pdf\\|jpg\\|png\\|gif\\|htm\\|html\\|sty\\|cls"
	  :publishing-function org-publish-attachment
	  )

	`(,current-project 
	  :components (,current-project-org 
		       ,current-project-static)
	  )))

(defun pb/create-org-publish-beamer-alist (current-project org-src-path org-publish-path &optional org-publish-function)
  "Create org-publish-alist configuration for LaTeX project."

  (setq current-project-org (concat current-project "-org"))
  (setq current-project-static (concat current-project "-static"))
;;  (if (not org-publish-function) (setq org-publish-function org-latex-publish-to-latex))

  (list `(,current-project-org
	  :base-directory ,org-src-path
	  :publishing-directory ,org-publish-path
	  :base-extension "org"
	  :recursive t
	  :publishing-function org-beamer-publish-to-latex
	  :export-with-tags nil
	  :headline-levels 10
	  :with-toc nil
	  :section-numbers t
	  :todo-keywords nil
	  :author nil
	  :creator-info nil
	  :table-auto-headline t
	  :style-include-default t
	  :timestamp f
	  :exclude-tags ("noexport")
	  :auto-preamble t)
	
	`(,current-project-static
	  :base-directory ,org-src-path
	  :publishing-directory ,org-publish-path
	  :recursive t
	  :base-extension "tex\\|pdf\\|jpg\\|png\\|gif\\|htm\\|html"
	  :publishing-function org-publish-attachment
	  )

	`(,current-project 
	  :components (,current-project-org 
		       ,current-project-static)
	  )))
