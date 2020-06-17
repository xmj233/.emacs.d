(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

(require 'recentf)
(recentf-mode t)
(setq recent-max-menu-items 10)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


(global-auto-revert-mode t)


(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("xmj" "xumengjiao")
					    ))

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;;hippie-expand
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

;;dired mode
;;+ 创建目录
;;g 刷新目录
;;C 拷贝
;;D 删除
;;R 重命名
;;d 标记删除
;;u 取消标记
;;x 执行所有的标记
(require 'dired-x)
;;可以使当一个窗口（frame）中存在两个分屏 （window）时，将另一个分屏自动设置成拷贝地址的目标。
(setq dired-dwin-target 1)

;;重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区
(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-better-defaults)
