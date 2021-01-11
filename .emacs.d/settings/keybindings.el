(global-set-key (kbd "s-R") 'compile)
(global-set-key (kbd "s-r") (lambda () (interactive) (progn (save-buffer)
							    (recompile))))
(global-set-key (kbd "s-k") 'kill-current-buffer)

(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Smex
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-x g") 'magit-status)

;; dired
(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "C-x +") 'make-empty-file)

(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-j") 'ace-jump-char-mode)
(global-set-key (kbd "C-x M-f") 'grep-find)
(global-set-key (kbd "C-x C-w") 'mark-word)

(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map (kbd "C-c C-l") 'python-shell-send-current-file)))

(provide 'keybindings)
