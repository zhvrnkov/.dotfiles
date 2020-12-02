(require 'ido)
(require 'ido-vertical-mode)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point nil
      ido-max-prospects 10)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode)
(ido-vertical-mode)

(provide 'setup-ido)
