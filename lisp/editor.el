;; frame title format
(setq frame-title-format '("" "%b (emacs)"))


(set-fill-column 80)

;; set your desired tab width
(setq-default indent-tabs-mode nil)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; highlight matching parens
(show-paren-mode t)

;; auto-add closing pairs (parens, quotes, etc)
(electric-pair-mode t)

;; highlight current line
(add-hook 'after-change-major-mode-hook 'hl-line-mode)

;; enable spellchecker in some contexts
(add-hook 'prog-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook  'flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)

(setq flyspell-issue-message-flag nil)

;; enable interactive do
(ido-mode t)

(setq default-indicate-empty-lines t)
(setq require-final-newline t)
(setq show-trailing-whitespace t)

;; disable auto-save capabilities
(setq make-backup-files nil)
(setq auto-save-default nil)

;; enable flex matching in ido-mode
(add-hook 'ido-setup-hook (lambda ()
                            (setq ido-enable-flex-matching t)))

;; move to a neighbor window using SHIFT-<arrow-key>
(windmove-default-keybindings)

;; buffer navigation
(global-set-key (kbd "C-c k") 'beginning-of-buffer)
(global-set-key (kbd "C-c j") 'end-of-buffer)

;; enlarge and shrink windows
;; -- useless alongside golden-ratio
;; (global-set-key (kbd "C-x <up>")    'shrink-window)
;; (global-set-key (kbd "C-x <right>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "C-x <down>")  'enlarge-window)
;; (global-set-key (kbd "C-x <left>")  'shrink-window-horizontally)

;; sane split window shortcuts
(global-set-key (kbd "C-x _") 'split-window-below)
(global-set-key (kbd "C-x |") 'split-window-right)

;; go
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c i") 'go-goto-imports)))
(add-hook 'go-mode-hook (lambda () (local-set-key (kbd "C-c C-e") 'go-errcheck)))

;; python
(unless (package-installed-p 'python-black)
  (package-refresh-contents)
  (package-install 'python-black))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook (lambda () (local-set-key (kbd "C-c C-j") 'elpy-go-to-definition)))

;; open content on git remote
(global-set-key (kbd "C-c g") 'open-file-in-git-remote)
