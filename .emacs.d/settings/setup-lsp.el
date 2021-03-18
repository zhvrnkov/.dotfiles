(require 'lsp-mode)
(require 'lsp-sourcekit)
(require 'subr-x)

(setq lsp-keymap-prefix "s-l")

(let ((path (string-trim-right (shell-command-to-string "xcrun --find sourcekit-lsp"))))
  (setq lsp-sourcekit-executable path))

(add-to-list 'lsp-language-id-configuration '(nothings-mode . "swift"))

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection 'lsp-sourcekit--lsp-command)
                  :major-modes '(swift-mode nothings-mode)
                  :server-id 'sourcekit-ls))

(provide 'setup-lsp)
