(global-set-key (kbd "s-R") 'compile)
(global-set-key (kbd "s-r") (lambda () (interactive) (progn (save-buffer)
							    (recompile))))

(provide 'keybindings)
