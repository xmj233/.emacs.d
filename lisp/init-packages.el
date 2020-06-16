(when (>= emacs-major-version 24)
     (require 'package)
     (setq package-archives '(
		      ("melpa" . "https://elpa.emacs-china.org/melpa/"))))
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		swiper
		counsel
		smartparens
		popwin
		;; --- Major Mode ---
	
		;; --- Minor Mode ---
		
		;; --- Themes ---
		monokai-theme
		leuven-theme
		;; solarized-theme
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))


(global-company-mode t)

;;(load-theme 'monokai t)

;;counsel and swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;paren
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

;;popwin
(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
