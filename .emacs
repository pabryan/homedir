;;; Auto load init files using in site-start directory
; This uses my-start-start available here
; http://porkmail.org/elisp/my-site-start/my-site-start.el

;; extra packages
(add-to-list 'load-path "~/working/external/org-mode/contrib/lisp")
(add-to-list 'load-path "~/.emacs.d/myelisp/")

;; use my-site-start
(autoload 'my-site-start "~/.emacs.d/my-site-start.el" nil t)
(my-site-start "~/.emacs.d/site-start.d/")

;; ispell language
(setq ispell-dictionary "british")

;; Use ibuffer
(defalias 'list-buffers 'ibuffer)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "x-www-browser")
 '(lpr-command "lpr")
 '(lpr-switches (quote ("-o sides=two-sided-long-edge")))
 '(org-agenda-files (quote ("~/org/refs.org" "/home/paul/org/academic.org" "/home/paul/org/anu.org" "/home/paul/org/diary.org" "/home/paul/org/exercisediary.org" "/home/paul/org/from-mobile.org" "/home/paul/org/goals.org" "/home/paul/org/habits.org" "/home/paul/org/hacking.org" "/home/paul/org/health.org" "/home/paul/org/healthdiary.org" "/home/paul/org/journal.org" "/home/paul/org/kate.org" "/home/paul/org/ledger.org" "/home/paul/org/lily.org" "/home/paul/org/personal.org" "/home/paul/org/processes.org" "/home/paul/org/refile.org" "/home/paul/org/remy.org" "/home/paul/org/research_notes.org" "/home/paul/org/ucsd.org" "/home/paul/org/workflow.org" "/home/paul/org/writing.org")))
 '(org-export-latex-default-packages-alist (quote (("AUTO" "inputenc" t) ("T1" "fontenc" t) ("" "fixltx2e" nil) ("" "graphicx" t) ("" "longtable" nil) ("" "float" nil) ("" "wrapfig" nil) ("" "soul" t) ("" "textcomp" t) ("" "marvosym" t) ("nointegrals" "wasysym" t) ("" "latexsym" t) ("" "amssymb" t) ("" "hyperref" nil) "\\tolerance=1000")))
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
