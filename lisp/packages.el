;; package repositories
(setq package-archives '(("gnu"          . "https://elpa.gnu.org/packages/")
                         ("melpa-stable" . "https://melpa.org/packages/")))

;; install use-package

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; package configuration

(use-package dracula-theme
  :ensure t
  :config (progn
            (load-theme 'dracula t)))

;; formatters
(use-package python-black
  :ensure t)

;; file modes
(use-package lsp-mode
  :ensure t)

(use-package crontab-mode
  :ensure t)

(use-package nginx-mode
  :ensure t)

(use-package rust-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :config (setq markdown-max-image-size '(600 . 600)))

(use-package dockerfile-mode
  :ensure t
  :mode ("\\.env" . conf-mode))

(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
  (add-hook 'go-mode-hook #'lsp-deferred))

(use-package jedi
  :ensure t)

(use-package python-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'python-black-on-save-mode))

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  (add-hook 'python-mode-hook (lambda () (local-set-key (kbd "C-c C-j") 'elpy-goto-definition))))

(use-package scala-mode
  :ensure t
  :mode "\\.s\\(cala\\|bt\\)$")

(use-package groovy-mode
  :ensure t
  :mode (("Jenkinsfile" . groovy-mode))
  :config (setq groovy-indent-offset 2))

(use-package js2-mode
  :ensure t
  :mode (("\\.js" . js2-mode))
  :config (setq js-indent-level 2))

(use-package terraform-mode
  :ensure t
  :config (add-hook 'terraform-mode-hook #'terraform-format-on-save-mode))

(use-package rego-mode
  :ensure t)


;; editing experience

(use-package persistent-scratch
  :ensure t
  :config (persistent-scratch-setup-default))

(use-package better-defaults
  :ensure t)

(use-package highlight-parentheses
  :ensure t)

(use-package whitespace-mode
  :bind (("C-x w" . whitespace-mode)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-c m *" . mc/edit-lines)
         ("C-c m >" . mc/mark-next-like-this)
         ("C-c m <" . mc/mark-previous-like-this)
         ("C-c m ." . mc/mark-all-like-this)
         ("C-c m i" . mc/mark-more-like-this-extended)))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))


;; tools

(use-package erc
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package diminish
  :ensure t
  :config (progn
            (diminish 'paredit-mode " ()")
            (diminish 'flyspell-mode " ~")
            (diminish 'eldoc-mode " doc")))


