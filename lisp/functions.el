
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))


(defun open-file-in-git-remote-with-lines ()
  "Open the current file in its Git remote, with selected lines."
  (interactive)
  (let* ((file-path (buffer-file-name))
         (start-line (line-number-at-pos (region-beginning)))
         (end-line (line-number-at-pos (region-end)))
         (remote-url (magit-get "remote.origin.url"))
         (branch (magit-get-current-branch))
         (remote-url (replace-regexp-in-string "\\(\\.git\\)$" "" remote-url))
         (https-url (replace-regexp-in-string "^git@\\([^:]+\\):" "https://\\1/" remote-url))
         (relative-path (file-relative-name file-path (magit-toplevel)))
         (https-url (concat https-url "/blob/" branch "/" relative-path)))
    (if (and start-line end-line)
        (setq https-url (concat https-url "#L" (number-to-string start-line) "-L" (number-to-string end-line))))
    (shell-command (concat "open " https-url))))

(global-set-key (kbd "C-c g") 'open-file-in-git-remote-with-lines)
