
;;Syntax highlighting in org-mode text
(require 'org)
(setq org-src-fontify-natively t)
;;agenda
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)


(provide 'init-org)
