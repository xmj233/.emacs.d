
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "<f2>") 'open-init-file)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)


(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "s-/") 'hippie-expand)

(global-set-key (kbd "C-c a") 'org-agenda)

;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "M-s o") 'occur-dwim)


;;expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;;org-capture
(global-set-key (kbd "C-c c") 'org-capture)

;;iedit
(global-set-key (kbd "C-;") 'iedit-mode)

;; Company-mode 中使用 C-n 与 C-p 来选择补全项
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;;helm-ag
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)


(provide 'init-keybindings)
