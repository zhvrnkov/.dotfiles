(custom-theme-set-faces 'user `(org-level-4 ((t (:foreground "#EFCC00")))))
(custom-theme-set-faces 'user `(org-level-5 ((t (:foreground "#008080")))))

(setq org-todo-keywords '((sequence "TODO" "STARTED" "DONE")))
(setq org-done-keywords '((sequence "DONE")))

(setq org-todo-keyword-faces '(("TODO" . "red") ("STARTED" . "yellow") ("DONE" . "green")))
(setq org-done-keyword-faces '(("DONE" . "green")))

(provide 'setup-org)
