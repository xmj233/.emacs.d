(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

(require 'recentf)
(recentf-mode t)
(setq recent-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


(global-auto-revert-mode t)


(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("xmj" "xumengjiao")
					    ))


(provide 'init-better-defaults)
