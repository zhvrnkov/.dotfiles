(require 'ido)
(require 'ido-vertical-mode)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode)
(ido-vertical-mode)

(defun my/anti-ido-advice (func &rest args)
  "Temporarily disable IDO and call function FUNC with arguments ARGS."
  (interactive)
  (progn
    (ido-everywhere 0)
    (ido-ubiquitous-mode 0)
    (icomplete-mode 0)
    (unwind-protect
        (if (called-interactively-p 'any)
            (call-interactively func)
          (apply func args))
      (ido-everywhere 1)
      (ido-ubiquitous-mode 1)
      (icomplete-mode 1))))

(defun my/disable-ido (command)
  "Disable IDO when command COMMAND is called."
  (advice-add command :around #'my/anti-ido-advice))

(my/disable-ido 'dired-create-directory)

(provide 'setup-ido)
