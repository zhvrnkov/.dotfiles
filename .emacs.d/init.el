(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil)

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(add-to-list 'load-path settings-dir)

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(s
     ace-jump-mode
     browse-kill-ring
     doom-themes
     exec-path-from-shell
     magit
     multiple-cursors
     undo-tree
     visual-regexp-steroids
     visual-regexp
     vterm
     nasm-mode
     plantuml-mode
     rust-mode
     swift-mode
     yaml-mode
     haskell-mode
     json-mode
     markdown-mode
     projectile
     yasnippet
     ivy
     ido-completing-read+)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; PATH
(require 'setup-path)

;; Font
(add-to-list 'default-frame-alist
             '(font . "JetBrains Mono-16"))

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Extensions
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'org '(require 'setup-org))
(eval-after-load 'rust-mode '(require 'setup-rust-mode))
(eval-after-load 'python '(require 'setup-python))
(eval-after-load 'swift-mode '(require 'setup-swift))
(eval-after-load 'plantuml-mode '(require 'setup-plantuml))
(eval-after-load 'geiser '(require 'setup-geiser))
(require 'setup-ido)
;; (require 'setup-ivy)
(require 'setup-projectile)

;; KeyBindings
(require 'keybindings)

;; Sanity
(require 'sane-defaults)

;; Write backups in ./.emacs_saves
(setq backup-directory-alist '(("." . "./.emacs_saves")))

;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Don't write lock-files, I'm the only one here
(setq create-lockfiles nil)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Setup environment variables from the user's shell.
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "SSH_AGENT_PID")
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")

;; Browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Maximized window on launch
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(put 'upcase-region 'disabled nil)
