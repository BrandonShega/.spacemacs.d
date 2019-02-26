;; -*- mode: emacs-lisp; lexical-binding: t -*-

(setq config-packages
      '(
        magithub
        mocha
        org-jira
        mac-pseudo-daemon
        lsp-sourcekit
        s
        eshell
        outshine
        ))

(defun config/init-magithub ()
  (use-package magithub))

(defun config/init-mocha ()
  (use-package mocha))

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

(defun config/init-s ()
  (use-package s))

(defun config/pre-init-eshell ()
  (spacemacs|use-package-add-hook eshell
    :post-init
    (evil-define-key '(normal insert) 'global (kbd "C-e") 'eshell-pop-eshell)))

(defun config/init-outshine ()
  (use-package outshine
    :hook ((prog-mode          . outline-minor-mode)
           (outline-minor-mode . outshine-mode))

    :bind (("<backtab>"     . outshine-cycle-buffer)
           ([(meta return)]       . outshine-insert-heading)
           ([(meta shift return)] . outshine-insert-subheading)
           :map outline-minor-mode-map)

    :init
    (progn
      (evil-define-key '(normal visual motion) outline-minor-mode-map
        "gh" 'outline-up-heading
        "gj" 'outline-forward-same-level
        "gk" 'outline-backward-same-level
        "gl" 'outline-next-visible-heading
        "gu" 'outline-previous-visible-heading)

      (spacemacs/set-leader-keys
        "nn" 'outshine-narrow-to-subtree
        "nw" 'widen
        "nj" 'outline-move-subtree-down
        "nk" 'outline-move-subtree-up
        "nh" 'outline-promote
        "nl" 'outline-demote)

      (advice-add 'outshine-narrow-to-subtree :before 'outshine-fix-narrow-pos)

      (advice-add 'outshine-insert-heading    :before 'outshine-fix-insert-pos)
      (advice-add 'outshine-insert-heading    :after 'evil-insert-advice)
      (advice-add 'outshine-insert-subheading :after 'evil-insert-advice)

      ;; Fix the new bindings in outline-minor-mode overwriting org-mode-map
      ;; I also add advice here because it mirrors outshine modifications
      (spacemacs|use-package-add-hook org
        :post-config
        (progn
          (bind-keys :map org-mode-map
                     ([(meta return)]       . org-meta-return)
                     ([(meta shift return)] . org-insert-subheading))
          (advice-add 'org-insert-heading    :before 'org-fix-heading-pos)
          (advice-add 'org-insert-heading    :after 'evil-insert-advice)
          (advice-add 'org-insert-subheading :after 'evil-insert-advice))))))
