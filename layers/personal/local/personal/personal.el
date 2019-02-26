;; -*- mode: emacs-lisp; lexical-binding: t -*-

(setq js2-mode-show-parse-errors nil
      js2-mode-show-strict-warnings nil)

(setq git-gutter:modified-sign " ")
(setq git-gutter:added-sign " ")
(setq git-gutter:deleted-sign " ")
(set-face-background 'git-gutter:modified "orange")
(set-face-background 'git-gutter:added "green")
(set-face-background 'git-gutter:deleted "red")

(setq mu4e-maildir (expand-file-name "~/mail"))

(setq mu4e-update-interval 60
      mu4e-get-mail-command "true"
      mu4e-view-show-images t
      mu4e-view-show-addresses t)

(setq mu4e-bookmarks
      `(
        ("maildir:/work/Inbox OR maildir:/home/Inbox" "All Inboxes" ?i)
        ("maildir:/home/Inbox" "Gmail" ?g)
        ("maildir:/work/Inbox" "Exchange" ?e)
        ("flag:unread AND NOT flag:trashed" "Unread Messages" ?u)
        ))

(setq mu4e-completing-read-function 'completing-read)

(setq mu4e-html2text-command 'mu4e-shr2text)
(add-hook 'mu4e-view-mode-hook
          (lambda()
            ;; try to emulate some of the eww key-bindings
            (local-set-key (kbd "<tab>") 'shr-next-link)
            (local-set-key (kbd "<backtab>") 'shr-previous-link)))
(setq shr-color-visible-luminance-min 80)

(setq shr-color-visible-distance-min 5)

(mu4e-alert-set-default-style 'notifier)

(setq org-directory "~/Dropbox/Organization"
      org-default-notes-file (concat org-directory "/notes.org")
      org-agenda-files (list org-directory))
(setq org-capture-templates
      '(
        ("t" "Task" entry (file "~/Dropbox/Organization/inbox.org")
        "* TODO %?\n")
        ("p" "Project" entry (file+headline "~/Dropbox/Organization/todo.org" "1 Projects")
        (file "~/Dropbox/Organization/templates/newprojecttemplate.org"))
        ("g" "Goal" entry (file+headline "~/Dropbox/Organization/goals.org" "Current Goals")
          (file "~/Dropbox/Organization/templates/newgoaltemplate.org"))))
(spacemacs/declare-prefix "aog" "project")
(spacemacs/set-leader-keys "aogp" 'go-to-projects)
(spacemacs/set-leader-keys "aogn" 'project-overview)
(spacemacs/set-leader-keys "aogm" 'areas-overview)
(spacemacs/set-leader-keys "aogl" 'project-deadline-overview)
(spacemacs/set-leader-keys "aogs" 'my-org-agenda-list-stuck-projects)
(spacemacs/set-leader-keys "aoga" 'go-to-areas)
