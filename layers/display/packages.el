;; -*- mode: emacs-lisp; lexical-binding: t -*-

(setq display-packages
      '(
        all-the-icons
        all-the-icons-ivy
        all-the-icons-dired
        doom-themes
        ))

(defun display/init-all-the-icons ()
  (use-package all-the-icons
    :defer t))

(defun display/init-all-the-icons-ivy ()
  (use-package all-the-icons-ivy
    :defer t
    :config
    (progn
      ;; Fix icon prompt alignment in ivy prompts
      (advice-add 'all-the-icons-ivy-file-transformer :override
                  'all-the-icons-ivy-file-transformer-stdized)

      ;; Add behavior to counsel projectile funcs too
      (advice-add 'counsel-projectile-find-file-transformer :filter-return
                  'all-the-icons-ivy-file-transformer-stdized)
      (advice-add 'counsel-projectile-transformer :filter-return
                  'all-the-icons-ivy-file-transformer-stdized)

      (all-the-icons-ivy-setup))))

(defun display/init-all-the-icons-dired ()
  (use-package all-the-icons-dired
    :defer t
    :hook (dired-mode . all-the-icons-dired-mode)))

(defun display/init-doom-themes ()
  (use-package doom-themes
    :defer t
    :config
    (setq doom-themes-enable-bold t
          doom-themes-enable-italic t)
    (doom-themes-visual-bell-config)
    (doom-themes-neotree-config)
    (doom-themes-treemacs-config)
    (doom-themes-org-config)
    ))
