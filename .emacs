(add-to-list 'load-path "~/.emacs.d")

;;; turn on syntax highlighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

; (setq tab-width 4)
(defun my-c-mode-hook ()
   (setq indent-tabs-mode nil
         c-basic-offset 4))
(add-hook 'c-mode-common-hook 'my-c-mode-hook) 

; bind hippie-expand to M-<spc>
(global-set-key "\M- " 'hippie-expand)

; change yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

; http://amitp.blogspot.com/2007/03/emacs-move-autosave-and-backup-files.html
;(defvar user-temporary-file-directory
;  (concat temporary-file-directory user-login-name "/"))
;(make-directory user-temporary-file-directory t)
;(setq backup-by-copying t)
;(setq backup-directory-alist
;      `(("." . ,user-temporary-file-directory)
;        (,tramp-file-name-regexp nil)))
;(setq auto-save-list-file-prefix
;      (concat user-temporary-file-directory ".auto-saves-"))
;(setq auto-save-file-name-transforms
;      `((".*" ,user-temporary-file-directory t)))


;http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)