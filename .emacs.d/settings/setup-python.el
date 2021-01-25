(require 'python)

(defun python-shell-send-current-file ()
  (interactive)
  (python-shell-send-file buffer-file-name))

(setq python-shell-interpreter "python3")

(provide 'setup-python)
