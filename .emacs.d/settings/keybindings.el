(global-set-key (kbd "s-R") 'compile)
(global-set-key (kbd "s-r") (lambda () (interactive) (progn (save-buffer)
							    (recompile))))
(global-set-key (kbd "s-k") 'kill-current-buffer)

(provide 'keybindings)
