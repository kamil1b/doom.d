;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(add-to-list 'auto-mode-alist '("\\.ttcn3\\'" . ttcn3-mode))

(setq
  doom-font (font-spec :family "Hack Nerd Font" :size 12)
  doom-big-font (font-spec :family "Hack Nerd Font" :size 18)
  doom-theme 'doom-tomorrow-night
  projectile-project-search-path '("~/Projects")
  org-agenda-files (quote ("~/ToDo/Projects.org")))

(def-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today)
                                  (:name "Due today"
                                         :time-grid t
                                         :deadline today)
                                  (:name "Important"
                                         :priority "A")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due soon"
                                         :deadline future)
                                  (:name "Big outcome"
                                         :tag "bo")))
  :config
  (org-super-agenda-mode)
  )


(defun my-doom/load-private-envvars ()
    (interactive)
    (doom-load-envvars-file (concat doom-private-dir "env")))
(my-doom/load-private-envvars)
