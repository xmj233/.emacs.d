(require 'cl)


(global-company-mode t)
(add-hook 'c-mode-hook
	  (lambda ()
	    (set (make-local-variable 'company-backends) '(company-clang company-anaconda))))




;;counsel and swiper
(ivy-mode t)
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

;;evil-mode
(require 'evil)
(evil-mode 1)
;;将 insert state map 中的快捷键清空，使其可以回退（Fallback）到 Emacs State
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;window-numbering
(window-numbering-mode 1)

;;evil-leader
(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files
  "fj" 'dired-jump
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":" 'counsel-M-x
  "wd" 'delete-other-windows
  "so" 'occur-dwim
  "si" 'counsel-imenu
  "se" 'iedit-mode)

;;evil-surround
(require 'evil-surround)
(global-evil-surround-mode)

;;evil-nerd-commenter
(evilnc-default-hotkeys) 


(provide 'init-packages)




