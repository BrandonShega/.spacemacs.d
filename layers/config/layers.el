;; -*- mode: emacs-lisp; lexical-binding: t -*-

(configuration-layer/declare-layers
  '(csv
    ivy
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
    lsp
    treemacs
    dap
    finance
    twitter
    rcirc
    web-beautify
    prettier
    osx
    themes-megapack
    multiple-cursors
    (javascript :variables
                javascript-backend 'lsp)
    (json :variables
          json-fmt-tool 'web-beautify)
    (auto-completion :variables
                     auto-completion-return-key-behavior 'complete
                     auto-completion-tab-key-behavior 'complete
                     auto-completion-enable-snippets-in-popup t)
    (python :variables
            python-backend 'lsp
            python-pipenv-activate t
            python-enable-yapf-format-on-save t)
    (java :variables
          java-backend 'lsp)
    (typescript :variables
                typescript-backend 'lsp)
                ;; tide-tsserver-executable "/Users/bshega/.nvm/versions/node/v9.8.0/bin/tsserver")
    (org :variables
         org-want-todo-bindings t
         org-enable-github-support t)
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
    (mu4e :variables
          mu4e-enable-notifications t
          mu4e-enable-mode-line t
          mu4e-installation-path "~/Dropbox/opt/mu/mu4e"
          mu4e-mu-binary "~/Dropbox/opt/mu/mu/mu")
    ))
