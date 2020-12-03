(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(package-initialize)

(setq inhibit-startup-screen t)

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

(add-to-list 'load-path settings-dir)

;; PATH
(require 'setup-path)

;; Font
(add-to-list 'default-frame-alist
             '(font . "JetBrains Mono-14"))

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; KeyBindings
(require 'keybindings)

;; EIMP
;;(require 'eimp)

;; Extensions
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'org '(require 'setup-org))
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'rust-mode '(require 'setup-rust-mode))

;; Sanity
(require 'sane-defaults)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

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

;; Browse kill ring
(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-linum-mode 1)

(setq python-shell-interpreter "python3")
(put 'upcase-region 'disabled nil)
