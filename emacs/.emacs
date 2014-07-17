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


;; startup stuff

;;(shell)                       ;; start a shell
;;(rename-buffer "shell-first") ;; rename it
(split-window-horizontally)   ;; want two windows at startup 
(other-window 1)              ;; move to other window






;;ORG.MODE GLOBAL KEYS
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;;Forgot what this does !
(iswitchb-mode 1)


;;Set Line numbers mode to on
(global-linum-mode t)

;; Add space after the line number 
(setq linum-format "%d ")

;;org mode paths ...
;;(add-to-list 'load-path "/home/chaos/emacs/org-8.2.4/lisp")

;;;;;;;;;;;;;;;;;;;;; *****************************************
;; org mode information and changes
;(setq org-default-notes-file (concat "~/dayIsDone/tasks.org"))

;; Clock Settings
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Org mode capture Templates !!
;; All these need to be reworked to point to the GTD.org file in
;; the correct category 
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline  "~/dayIsDone/GTD.org" "Tasks")
	 "* TODO %? Added: %U \n %i\n %a \n")
	("p" "Project" entry (file "~/dayIsDone/projects.org" )
	 "* %^{prompt}\n** TODO %? %t\n %i\n %a")
	("w" "Work" entry (file "~/dayIsDone/work.org" )
	 "* %^{prompt}\n** TODO %? %t\n %i\n %a")
	("h" "House" entry (file+datetree "~/dayIsDone/house.org" "House Stuff")
	 "* TODO %? %t\n %i\n %a")
	("s" "School" entry (file+datetree "~/dayIsDone/school.org" )
	 "* TODO %? %t\n %i\n %a")
	("l" "Lisp" entry (file "/home/chaos/chaoskampf/hunter/spring2014/aI350/GetALisp/LISP.org" )
	 "* CHECK_OUT %? %t\n %i\n %a")
	("i" "Ideas" entry (file+datetree "~/dayIsDone/Ideas.org" )
	 "* CHECK_OUT %? %t\n %i\n %a")
	))
;; org store link
(define-key global-map "\C-cl" 'org-store-link)

;; org mode agenda files
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/dayIsDone/tasks.org"
			     "~/dayIsDone/GTD.org"
			     "~/dayIsDone/work.org"
			     "~/dayIsDone/school.org"
			     "~/dayIsDone/projects.org"
			     "~/dayIsDone/Year_Plan_2014.org"
			     "~/dayIsDone/Winter_Plans_2013-14.org"
			     "~/dayIsDone/house.org"))

;; org mode TODO FUNCTIONALITY
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "|" "ABORT(a)" "DONE(d)")
	(sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
	(sequence "|" "CHECK_OUT(c)")))


;; org mode TAG list
(setq org-tag-alist
      '(("SCHOOL" . ?s)
	("HOUSE" . ?h)
	("PROJECT" . ?p)
	("WORK" . ?w)
	("@computer" . ?c)
	("@phone" . ?p)))

;;;;;;;;;;;;;;;;;;Org mode Latex Related
(require 'org-latex)
(setq org-export-latex-listings t)

;(unless (boundp 'org-export-latex-classes)
;  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
	     '("article"
	       "\\documentclass{article}"
	       ("\\section{%s}" . "\\section*{%s}")))

;(add-to-list 'org-export-latex-packages-alist
;	     '(("AUTO" "inputenc" t)))
;(require 'org-latex)
(add-to-list 'org-export-latex-classes
	     '("org-article"
	       "\\documentclass{org-article}
	       [NO-DEFAULT-PACKAGES]
	       [PACKAGES]
	       [EXTRA]"
	       ("\\section{%s}"."\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; http://tex.stackexchange.com/questions/54205/org-mode-export-to-latex-temptation-or-nuisance
;(require 'org-latex)
(add-to-list 'org-export-latex-classes
             '("myarticle"
"\\documentclass[a4paper,12pt]{article}

\\usepackage[utf8]{inputenc}
\\usepackage{lmodern}
\\usepackage[T1]{fontenc}

\\usepackage{fixltx2e}

\\newcommand\\foo{bar}
               [NO-DEFAULT-PACKAGES]
               [NO-PACKAGES]
               [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
           ("\\subsection{%s}" . "\\subsection*{%s}")
           ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
           ("\\paragraph{%s}" . "\\paragraph*{%s}")
           ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;(require 'org-latex)
(add-to-list 'org-export-latex-classes
	     '("koma-article"
	       "\\documentclass{scrartcl}"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;;;;;;;;;;;;;;;;;;;;;;;;

;;;;ORG PUBLISH SECTION MOST CODE FROM BELOW TUTORIAL
;;;; http://www.personal.psu.edu/nus173/sitecreation.html
(require 'org-publish)

(defun my-org-html-publish-to-html (plist filename pub-dir)
  (org-publish-org-to 'html filename ".org" plist pub-dir))

(setq org-publish-project-alist
      '(
	(setq debug-on-error t)
	("org-notes"
	 :base-directory "~/Dev/n-critser.github.io/www-org/"
	 :base-extension "org"
	 :publishing-directory "~/Dev/n-critser.github.io/"
	 :recursive t
	 :publishing-function org-publish-org-to-html
	 :headline-levels 4  ;;change to a new default
	 :auto-preamble t
	 )
	))


;;;;  SLIME MODE INFO GOES HERE

(setq inferior-lisp-program "~/scripts/ccl64")
(require 'slime-autoloads)
(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-fancy))

(setq slime-lisp-implementations
      '((ccl64 ( "~/scripts/ccl64"))
	(sbcl ("/opt/sbcl/bin/sbcl") :coding-system utf-8-unix)))

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
    (setq c-basic-offset 8)))

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
;; WHAT THE HELL IS THIS? 
(require 'font-lock)
(setq nick-foreground "light blue")
(setq nick-background "black")
(setq nick-cursor "organge")
(setq nick-comment "cyan")
;(set-background-color "Black")
;(set-foreground-color "light blue")
;(set-cursor-color "dark cyan")


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
  (set-background-color nick-background)
  (set-foreground-color nick-foreground)
  (set-cursor-color nick-cursor)
  (copy-face 'default   'comment)
;  (set-face-foreground  'comment "dark cyan")
; (set-face-foreground  'comment "Ligh sky blue")
  (set-face-background  'comment nick-comment)
  (setq font-lock-comment-face 'comment)

  (copy-face 'default   'string)
  (set-face-foreground  'string "orange")
  (set-face-background  'string "dark blue")
  (setq font-lock-string-face 'string)

  (copy-face 'default   'function-name)
  (set-face-foreground  'function-name "Red")
  (setq font-lock-function-name-face 'function-name)

 
  (copy-face 'default   'type)
  (set-face-foreground  'type "light sky  blue")
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



;;=========Set Colors ========================

;;set cursor and moust-point colors
;;(set-cursor-color "red")
;;(set-mouse-color "goldenrod")

;;set region background color
;;(set-face-background 'region' "blue")
;;find display colors with M-x list-colors-dipslay
;; set emacs background color
;;(set-background-color "dark cyan");;008b8b


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

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
;(load "js-config.el")
;(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
;(require 'sws-mode)
;(require 'jade-mode)
;(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
;(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))