(require 'ido)
(require 'ido-vertical-mode)
(require 'ido-at-point)

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

(require 'flx-ido)
(flx-ido-mode 1)

;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

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
