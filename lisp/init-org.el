
;;Syntax highlighting in org-mode text
(require 'org)
(setq org-src-fontify-natively t)
;;agenda
(setq org-agenda-files '("~/org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Work Arrangement")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))



(provide 'init-org)
