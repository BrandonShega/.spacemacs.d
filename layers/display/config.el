;; ;; -*- mode: emacs-lisp; lexical-binding: t -*-
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-file-name-style 'relative-to-project)
(setq doom-modeline-mu4e t)
(setq doom-modeline-irc t)

(set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 120)

(fringe-mode '4)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
