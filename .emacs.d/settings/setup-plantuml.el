(require 'plantuml-mode)

(setq plantuml-executable-path "/usr/local/bin/plantuml")
(setq plantuml-default-exec-mode 'executable)
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))

(provide 'setup-plantuml)
