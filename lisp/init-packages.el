(require 'cl)


(global-company-mode t)
(add-hook 'c-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '(company-clang company-anaconda))))



;;(load-theme 'monokai t)

;;counsel and swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;paren
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
;;unmatch '
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)

;;flycheck
(add-hook 'c-mode-hook 'flycheck-mode)

;;yasnippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;;popwin
(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
