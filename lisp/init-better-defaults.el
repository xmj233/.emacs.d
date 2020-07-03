(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

(require 'recentf)
(recentf-mode t)
(setq recent-max-menu-items 10)

;;光标在括号内时就高亮包含内容的两个括号  show-paren-mode extend
;;(define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;"Highlight enclosing parens."
;;(cond ((looking-at-p "\\s(") (funcall fn))
;;	(t (save-excursion
;;	     (ignore-errors (backward-up-list))
;;	     (funcall fn)))))
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it)))
  )
;;高亮括号   show-paren-mode
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;在emacs外修改文件时，对emacs进行同步
(global-auto-revert-mode t)


(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("xmj" "xumengjiao")
					    ))

;;indent-region 可以帮我们重新缩进所选区域的代码，但是每一次都选中十分麻烦。使用 下面的代码可以一次重新缩进全部缓冲区的代码。
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
;;C-x C-q to edit
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

;;occur-mode     M-s o
;;Occur 与普通的搜索模式不同的是，它可以使用 Occur-Edit Mode (在弹出的窗口中按 e 进入编辑模式) 对搜索到的结果进行之间的编辑
(defun occur-dwim ()
  ;;dwim is mean "do what I mean"
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

;;imenu

(provide 'init-better-defaults)
