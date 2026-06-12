;; (setq user-emacs-directory "~/.config/emacs")
(setq user-emacs-directory (concat (or (getenv "XDG_CONFIG_HOME") "~/.config/") "emacs"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(wheatgrass))
 '(inhibit-startup-screen t)
 '(tex-fontify-script nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 158 :width normal))))
 '(bold ((t nil)))
 '(italic ((t nil)))
 '(tex-verbatim ((t nil))))

(setq
 backup-directory-alist `(("." . ,(concat (or (getenv "XDG_STATE_HOME") "~/.local/state") "/emacs/backup")))
 backup-by-copying t    ; Don't delink hardlinks
 version-control t      ; Use version numbers on backups
 delete-old-versions t  ; Automatically delete excess backups
 kept-new-versions 10   ; how many of the newest versions to keep
 kept-old-versions 5    ; and how many of the old
 )

(setq compile-command "cd $(git rev-parse --show-toplevel) && make")

;; Keep folders clean (create new directory when not yet existing)
;; (make-directory (expand-file-name "backups/" user-emacs-directory) t)
;; (setq backup-directory-alist `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq font-latex-fontify-sectioning 'color)
;; (setq font-latex-deactivated-keyword-classes '("italic-command" "bold-command" "italic-declaration" "bold-declaration"))

(add-to-list 'load-path (concat (or (getenv "XDG_CONFIG_HOME") "~/.config") "/emacs/lisp/") t) ; Add dir with local packages to the end of the load-path

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

(load-theme 'tango-dark t)

;; Hide toolbar buttons
(tool-bar-mode 0)

;; Change default font size
(set-frame-font "Mono 18" nil t)

;; Key bindings
(global-set-key [f2] 'compile)
