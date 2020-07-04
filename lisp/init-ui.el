;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 110)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(global-linum-mode t)

(setq inhibit-splash-screen -1)

(global-hl-line-mode 1)

(setq-default cursor-type 'bar)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(load-theme 'solarized-wombat-dark t)



(provide 'init-ui)
