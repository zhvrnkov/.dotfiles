(require 'lsp-mode)
;; (require 'lsp-sourcekit)
(require 'subr-x)

(setq lsp-keymap-prefix "s-l")

(setq lsp-haskell-server-path "/home/vz/.ghcup/bin/haskell-language-server-wrapper")

;; (let ((path (string-trim-right (shell-command-to-string "xcrun --find sourcekit-lsp"))))
;;   (setq lsp-sourcekit-executable path))

(provide 'setup-lsp)
