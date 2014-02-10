(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;check out http://www-cdf.fnal.gov/~sthrlnd/emacs_help.html
;;Everything below this line is from : 
;;http://davidmedinawiki.wordpress.com/2012/06/02/my-emacs-file/
(global-font-lock-mode t)

(setq make-backup-files nil)

(iswitchb-mode 1)

;;Set Linum-Mode on
(global-linum-mode t)

;;Linum Mode and add space after the number 
(setq linum-format "%d ")