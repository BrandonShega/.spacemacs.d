;; -*- mode: emacs-lisp; lexical-binding: t -*-

(configuration-layer/declare-layers
  '(csv
    helm
    (auto-completion :variables
                     auto-completion-return-key-behavior 'complete
                     auto-completion-tab-key-behavior 'complete
                     auto-completion-enable-snippets-in-popup t)
    emacs-lisp
    git
    swift
    tmux
    haskell
    html
    yaml
    ruby-on-rails
    javascript
    restclient
    syntax-checking
    spotify
    search-engine
    personal-config
    visual-regexp
    lsp
    treemacs
    dap
    finance
    twitter
    (python :variables
            python-backend 'lsp
            python-pipenv-activate t
            python-enable-yapf-format-on-save t)
    (java :variables
          java-backend 'lsp)
    (typescript :variables
                typescript-backend 'tide
                tide-tsserver-executable "/Users/bshega/.nvm/versions/node/v9.8.0/bin/tsserver")
    (org :variables
        org-want-todo-bindings t)
    (version-control :variables
                    version-control-diff-tool 'diff-hl
                    version-control-global-margin t
                    version-control-diff-side 'left)
    (markdown :variables
              markdown-command "/usr/local/bin/pandoc")
    (ruby :variables
          ruby-enable-enh-ruby-mode t
          ruby-version-manager 'rvm
          ruby-test-runner 'rspec)
    (shell :variables
          shell-default-height 30
          shell-default-position 'bottom)
    (dash :variables
          helm-dash-docsets-path "~/Library/Application Support/Dash/DocSets")
    (mu4e :variables
          mu4e-enable-notifications t
          mu4e-enable-mode-line t)
    ))
