;; -*- mode: emacs-lisp; lexical-binding: t -*-

(setq config-packages
      '(
        magithub
        mocha
        writeroom-mode
        org-jira
        mac-pseudo-daemon
        lsp-sourcekit
        s
        auto-dim-other-buffers
        eshell
        js2-mode
        git-gutter
        mu4e
        mu4e-alert
        org
        ))

(defun config/init-magithub ()
  (use-package magithub))

(defun config/init-mocha ()
  (use-package mocha))

(defun config/init-whiteroom-mode ()
  (use-package whiteroom-mode))

(defun config/init-org-jira ()
  (use-package org-jira
    :config
    (setq jiralib-url "https://gpgdigital.atlassian.net")))

(defun config/init-mac-pseudo-daemon ()
  (use-package mac-pseudo-daemon))

(defun config/init-lsp-sourcekit ()
  (use-package lsp-sourcekit
    :config
    (setenv "SOURCEKIT_TOOLCHAIN_PATH" "/Library/Developer/Toolchains/swift-5.0-DEVELOPMENT-SNAPSHOT-2019-01-22-a.xctoolchain")
    (setq lsp-sourcekit-executable (expand-file-name "~/Documents/personal-dev/sourcekit-lsp/.build/x86_64-apple-macosx/debug/sourcekit-lsp"))))

(defun config/s ()
  (use-package s))

(defun config/init-auto-dim-other-buffers ()
  (use-package auto-dim-other-buffers
    :config
    (auto-dim-other-buffers-mode)))

(defun config/pre-init-eshell ()
  (spacemacs|use-package-add-hook eshell
    :post-init
    (evil-define-key '(normal insert) 'global (kbd "C-e") 'shell-pop-eshell)))

(defun config/init-js2-mode ()
  (use-package js2-mode
    :config
    (setq js2-mode-show-parse-errors nil
          js2-mode-show-strict-warnings nil)))

(defun config/init-git-gutter ()
  (use-package git-gutter
    :config
    (setq git-gutter:modified-sign " ")
    (setq git-gutter:added-sign " ")
    (setq git-gutter:deleted-sign " ")
    (set-face-background 'git-gutter:modified "orange")
    (set-face-background 'git-gutter:added "green")
    (set-face-background 'git-gutter:deleted "red")))

(defun config/init-mu4e ()
  (use-package mu4e
    :conifg
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

    (require 'mu4e-contrib)
    (setq mu4e-html2text-command 'mu4e-shr2text)
    (add-hook 'mu4e-view-mode-hook
              (lambda()
                ;; try to emulate some of the eww key-bindings
                (local-set-key (kbd "<tab>") 'shr-next-link)
                (local-set-key (kbd "<backtab>") 'shr-previous-link)))
    (setq shr-color-visible-luminance-min 80)

    (setq shr-color-visible-distance-min 5)))

(defun config/init-mu4e-alert ()
  (use-package mu4e-alert
    :config
    (mu4e-alert-set-default-style 'notifier)))

(defun config/init-org ()
  (use-package org
    :config
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
    (spacemacs/set-leader-keys "aoga" 'go-to-areas)))
