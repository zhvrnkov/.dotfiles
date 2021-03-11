(require 'ivy)

(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-format-function 'ivy-format-function-line)
'(ivy-highlight-face ((t (:background "#383b31"))))

(provide 'setup-ivy)
