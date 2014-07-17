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
;; the following commands taken from this page
;;http://homepages.inf.ed.ac.uk/s0243221/emacs/
;;=======prevent emacs from making backup files
(setq make-backup-files nil)

;;http://davidmedinawiki.wordpress.com/2012/06/02/my-emacs-file/
(global-font-lock-mode t)

(setq make-backup-files nil)

;;Forgot what this does !
(iswitchb-mode 1)

;;Set Line numbers mode to on
(global-linum-mode t)

;; Add space after the line number 
(setq linum-format "%d ")

;;org mode paths ...
;;(add-to-list 'load-path "/home/chaos/emacs/org-8.2.4/lisp")



(add-to-list 'load-path "~/.emacs.d")
;;auto-complete addon
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
;;(require 'auto-complete-config)
;;(ac-config-default)


;;set cedet
;(load-file "~/emacs/cedet-1.1/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;;alexott.net/en/writings/emacs-devenv/EmacsCedet.html
;;
;(global-cedet-m3-minor-mode)
;(global-semantic-highlight-func-mode)
;(global-semantic-stickyfunc-mode)
;(global-semantic-decoration-mode)
;(global-semantic-idle-local-symbol-highlight-mode)
;(global-semantic-idle-scheduler-mode)
;(global-semantic-idle-completions-mode)
;(global-semantic-show-unmatched-syntax-mode )

;;more for debug
;;(global-semantic-show-unmatched-syntax-mode)
;;(global-semantic-show-parser-state-mode)
;;(global-semantic-highlight-edits-mode)
;;
;;(require 'semantic/ia)
;;(require 'semantic/bovine/gcc)
;;(semantic-mode )

;(setq ncurses-base-dir "/usr/include/ncurses.h")
;(semantic-add-system-include ncurses-base-dir 'c++-mode)
;(add-to-list 'auto-mode-alist (cons ncurses-base-dir 'c++-mode))
;(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat ncurses-base-dir))

;;magit
(require 'magit)

;;=====set standard indent size to 4===
;;=====set style to curly under word mode===
(setq c-default-style "linux")
(add-hook 'c++-mode-hook ' (lambda ()
    (setq c-basic-offset 8)))
(add-hook 'c-mode-hook ' (lambda ()
    (setq c-basic-offset 4)))

; Use only spaces for indentation (default is tabs mixed with spaces)
; so that our files will always look the same regardless of the viewing
; software.

(add-hook 'c++-mode-hook '(lambda ()
    (setq indent-tabs-mode nil)))
(add-hook 'c-mode-hook '(lambda ()
    (setq indent-tabs-mode nil)))
(add-hook 'lisp-mode-hook '(lambda ()
	(setq indent-tabs-mode nil)))
(add-hook 'python-mode-hook '(lambda ()
	(setq indent-tabs-mode nil)))

; Make Emacs use "newline-and-indent" when you hit the Enter key so
; that you don't need to keep using TAB to align yourself when coding.
; This is akin to setting autoindent in vi.

(global-set-key "\C-m" 'newline-and-indent)


 ;make open-braces after a case: statement indent to 0 (default was '+)
(c-set-offset 'statement-case-open 0)

;;taken from http://www.cs.cmu.edu/~keng/emacs.config
;;========font lock==================
(require 'font-lock)
(setq nick-foreground "light  green")
(setq nick-background "dark cyan")


;(setq font-lock-function-name-face 'bold)
;(setq font-lock-comment-face       'default)
;(setq font-lock-string-face        'default)
;(setq font-lock-doc-string-face    'default)
;(setq font-lock-keyword-face    'default)
;(setq font-lock-type-face    'default)
;;;
;;; Set special face attributes 
;;; (inside an error handler in case something is not available)
;;;

(defun set-colors ()
  (copy-face 'default   'comment)
;  (set-face-foreground  'comment "dark cyan")
; (set-face-foreground  'comment "Ligh sky blue")
  (set-face-background  'comment nick-background)
  (setq font-lock-comment-face 'comment)

  (copy-face 'default   'string)
  (set-face-foreground  'string "orange")
  (set-face-background  'string "dark blue")
  (setq font-lock-string-face 'string)

  (copy-face 'default   'function-name)
  (set-face-foreground  'function-name "Red")
  (setq font-lock-function-name-face 'function-name)
  
  (copy-face 'default   'type)
  (set-face-foreground  'type "MediumSpringGreen")
  (setq font-lock-type-face 'type)
  
  (copy-face 'default   'keyword)
  (set-face-foreground  'keyword "turquoise")
  (set-face-background 'keyword "dark red")
  (setq font-lock-keyword-face 'keyword)

  (copy-face 'default   'docstr)
  (set-face-foreground  'docstr "blue")
 (set-face-background  'docstr "black")
  (setq font-lock-doc-string-face 'docstr)
)

(if window-system
    (condition-case nil 
        (progn
          (set-face-foreground  'region nick-foreground)
          (set-face-background  'region "blue")
          (if (not (x-display-color-p))
              (set-face-underline-p 'region t))
          
          (set-face-foreground  'bold   nick-foreground)
          (set-face-background  'bold   "red")
          (set-face-underline-p 'bold   "purple")
          
          (if (x-display-color-p)
	      (set-colors)
	    ))
      
      (error nil)))
;;;
;;; Set the fonts in Emacs
;;; (also in an error handler in case some fonts dont exist)
;;;

;(if window-system
;    (condition-case nil 
;        (progn
;          (set-face-font 'bold 
;                         "-adobe-courier-bold-r-normal--*-*-75-75-m-*-*-1")
;          (set-face-font 'italic 
;                         "-adobe-courier-medium-o-normal--*-*-75-75-m-*-*-1")
;          (set-face-font 'comment 
;                         "-adobe-courier-medium-o-normal--*-*-75-75-m-*-*-1")
;          (set-face-font 'bold-italic 
;                         "-adobe-courier-bold-o-normal--*-*-75-75-m-*-*-1"))
;      (error nil)))

(set-background-color "Black")
(set-foreground-color "light green")
(set-cursor-color "dark cyan")


;;=========Set Colors ========================

;;set cursor and moust-point colors
;;(set-cursor-color "red")
;;(set-mouse-color "goldenrod")

;;set region background color
;;(set-face-background 'region' "blue")
;;find display colors with M-x list-colors-dipslay
;; set emacs background color
;;(set-background-color "dark cyan");;008b8b

;; startup stuff 
;;(split-window-horizontally)   ;; want two windows at startup 
;;(other-window 1)              ;; move to other window
;;(shell)                       ;; start a shell
;;(rename-buffer "shell-first") ;; rename it

;;new shit for adding a skeleton for a new file
;(eval-after-load 'autoinsert
;  '(define-auto-insert
;     '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ skeleton")
;     '("Short description: "
;       "/*" \n
;       (file-name-nondirectory (buffer-file-name))
;       " --" str \n
;       " */" > \n \n
;       "#include <iostream>" \n \n
;       "using namespace std;" \n \n
;       "main()" \n
;       "{" \n
;       > _ \n
;       "}" > \n)))
