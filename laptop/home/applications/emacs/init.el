;;; emacs

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; quit Emacs directly even if there are running processes
(setq confirm-kill-processes nil)

;; disable tool-bar
(when (fboundp 'tool-bar-mode)
	(tool-bar-mode -1))
;; disable bell ring
(setq-default ring-bell-function 'ignore)
;; disable startup screen
(setq-default inhibit-startup-screen t)

;; fonts
(cond
 ((find-font (font-spec :name "IosevkaNerdFontMono"))
	(set-frame-font "IosevkaNerdFontMono-16" t t)))

;; show cursor locations
(line-number-mode t)
;; show corsor column locations
(column-number-mode t)
;; show file size
(size-indication-mode t)
;; show line number
(global-display-line-numbers-mode t)

;; auto-pair
(electric-pair-mode t)

;; cursor blink animation
(blink-cursor-mode nil)

;; theme
(load-theme 'modus-vivendi-tinted t)

;; enable y/n ansers
(fset 'yes-or-no-p 'y-or-n-p)

;; disable tab to indent
(setq-default indent-tabs-mode nil)

(setq-default tab-width 2)
;; make selection can be replace directly
(delete-selection-mode t)

(global-auto-revert-mode t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; personal prefix key
(defvar prefix-map (make-sparse-keymap)
  "My personal global prefix keymap.")
(global-unset-key (kbd "C-z"))
(define-key global-map (kbd "C-z") prefix-map)
;;; emacs end


;;; use-package

;; not auto install globaly
(setq use-package-always-ensure nil)

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))
