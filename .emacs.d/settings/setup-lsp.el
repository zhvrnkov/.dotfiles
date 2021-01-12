(require 'lsp-mode)
(require 'lsp-sourcekit)
(require 'subr-x)

(setq lsp-keymap-prefix "s-l")

(let ((path (string-trim-right (shell-command-to-string "xcrun --find sourcekit-lsp"))))
  (setq lsp-sourcekit-executable path))

(provide 'setup-lsp)
