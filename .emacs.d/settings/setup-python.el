(require 'python)

(defun python-shell-send-current-file ()
  (interactive)
  (python-shell-send-file buffer-file-name))

(provide 'setup-python)
