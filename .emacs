; Necessary for shell-command to have the correct path
; Can supposedly also be accomplished via:
; defaults write ~/.MacOSX/environment PATH "/Users/badkins/sync/bin:..."
; but that didn't seem to work, and I was concerned that it would be too hidden
; I like the explicit setting below
;;(carbon-emacs-package-add-to-path "/Users/badkins/sync/bin")

;; After switching from CarbonEmacs to Emacs.app built from Emacs 23
;; source, the following 2 lines allow running shell-command:

(setq path "/Users/tdavies/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin")
(setenv "PATH" path)

(require 'tramp)
(setq tramp-default-method "scp")
(require 'misc) ;; for forward-to-word

(require 'dired-x) ;; allows using M-o to omit certain files in dired
(setq-default dired-omit-files-p t)

;; Configure aspell
(setq-default ispell-program-name "aspell")

;; Use Spotlight for M-x locate command
(setq locate-command "mdfind")

(set-frame-name "Emacs")
(blink-cursor-mode 1)

;; After switching to building Emacs.app from source I noticed that it
;; expected the alt/option key to be meta instead of the command
;; key. The following 4 lines fix the problem.
;; (setq mac-option-key-is-meta nil)
;; (setq mac-command-key-is-meta t)
;; (setq mac-command-modifier 'meta)
;; (setq mac-option-modifier nil)
(setq ns-command-modifier 'meta)     ;; Assign cmd to meta
(setq ns-alternate-modifier 'super)  ;; Assign alt/option key to super

(add-to-list 'exec-path "/usr/local/bin")

; ****************************************
; Directory for elisp files
; ****************************************
(add-to-list 'load-path "~/emacs")

(load "calc.el")
(load "bja-growl")  ;; bja-common refers to bja-growl
(load "bja-common")
(load "bja-adium")
(load "bja-deft")
(put 'downcase-region 'disabled nil)

; ****************************************
; Sound support for Mac OSX 
; Dependens on "Play Sound" application
; ****************************************
(setq play-sound-script (format "
  set cusrPath to (path to \"cusr\" as string)

  tell application \"Play Sound\"
    play (soundAlias as alias)
  end tell
  "))

; ****************************************
; Calendar
; ****************************************

(setq islamic-holidays nil)
(setq bahai-holidays nil)
(setq oriental-holidays nil)

(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'list-diary-entries-hook 'sort-diary-entries t)

(setq appt-audible t)
(setq appt-display-duration 10) ; in seconds
(setq appt-display-interval 5) ; in minutes
(setq appt-display-format 'window)
(setq appt-display-mode t) ; display minutes until appt. in mode line
(setq appt-message-warning-time 1) ; lead time in minutes
(appt-activate 1)

; ****************************************
; Time tracker
; ****************************************
(setq timeclock-file "~/emacs/timelog")
(setq timeclock-relative nil)
(setq timeclock-workday (* 8 60 60))

; ****************************************
; TODO list
; ****************************************
(autoload 'todo-mode "todo-mode" "Major mode for editing TODO lists." t)
(autoload 'todo-show "todo-mode" "Show TODO items." t)
(autoload 'todo-insert-item "todo-mode" "Add TODO item." t)
(setq todo-file-do "~/emacs/todo-do")
(setq todo-file-done "~/emacs/todo-done")
(setq todo-file-top "~/emacs/todo-top")
(setq todo-remove-separator nil)  ; leave separate line when viewing top items

; ****************************************
; Load CEDET
; ****************************************

;bja (load-file "~/software/cedet-1.0pre4/common/cedet.el")

;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator

;bja (semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as the nascent intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-guady-code-helpers)

;; * This turns on which-func support (Plus all other code helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; This turns on modes that aid in grammar writing and semantic tool
;; development.  It does not enable any other features such as code
;; helpers above.
;; (semantic-load-enable-semantic-debugging-helpers)

;; ECB

;bja (add-to-list 'load-path "~/software/ecb-2.32")
;(require 'ecb)  ;; Pro: all ECB options available, Con: slow loading

;bja (require 'ecb-autoloads) ;; Pro: fast loading, Con: must start ECB

; ****************************************
; Programming Language Modes
; ****************************************

; Haml Mode
(autoload 'haml-mode "haml-mode" "A major mode for Haml" t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

; Sass Mode
(autoload 'sass-mode "sass-mode" "A major mode for Sass" t)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

; CoffeeScript Mode
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(autoload 'coffee-mode "coffee-mode" "A major mode for CoffeeScript" t)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
;(require 'coffee-mode)

; Ruby Mode
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml$" . ruby-mode))

(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (imenu-add-to-menubar "IMENU")
;            (define-key ruby-mode-map "C-m" 'newline-and-indent) ;Not sure if this line is 100% right but it works!
            (require 'ruby-electric)
            (ruby-electric-mode t)
            ))

(setq js-indent-level 2)
;; JavaScript Mode
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; To choose a font in Carbon Emacs
;; 1. M-x mac-font-panel-mode and pick the font you want.
;; 2. M-x describe-font and copy the font name (e.g. "-apple-inconsolata-medium-r-normal--13-130-72-72-m-130-iso10646-1")
;; 3. Add the following to your .emacs file: (set-default-font "-apple-inconsolata-medium-r-normal--13-130-72-72-m-130-iso10646-1")

;; Use this to make the font display without antialiasing
;; defaults write org.gnu.Emacs AppleAntiAliasingThreshold 100

; ****************************************
; Syntax Coloring
; ****************************************
; To see faces and colors:
; M-x list-colors-display
; M-x list-faces-display
(setq font-lock-face-attributes
      ;; FACE FG BG bold italic underline
      '((font-lock-comment-face "green1")
        (font-lock-comment-delimiter-face "green4")
        (font-lock-constant-face "firebrick")
        (font-lock-function-name-face "SkyBlue1" nil t)
        (font-lock-keyword-face "violet") 
        (font-lock-string-face "Cyan")
        (font-lock-type-face "CornflowerBlue" nil t)
        (font-lock-variable-name-face "gold1")
        (region "Black" "White")
        (default "LightGoldenrodYellow")))
  
; ****************************************
; Custom settings
; ****************************************
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-coding-alist (quote (("\\.\\(zip\\|lzh\\|lha\\|zoo\\|[jew]ar\\|xpi\\|exe\\|rar\\|ARC\\|ZIP\\|LZH\\|LHA\\|ZOO\\|[JEW]AR\\|XPI\\|EXE\\|RAR\\)\\'" . no-conversion) ("\\.\\(sx[dmicw]\\|odt\\|tar\\|tgz\\)\\'" . no-conversion) ("\\.\\(gz\\|Z\\|bz\\|bz2\\|gpg\\)\\'" . no-conversion) ("\\.\\(jpe?g\\|png\\|gif\\|tiff?\\|p[bpgn]m\\)\\'" . no-conversion) ("\\.pdf\\'" . no-conversion) ("/#[^/]+#\\'" . emacs-mule))))
 '(canlock-password bja-canlock-password)
 '(column-number-mode t)
 '(comint-input-ring-size 10000)
 '(css-indent-offset 2)
 '(desktop-save-mode nil)
 '(ecb-options-version "2.32")
 '(ediff-diff-options "-w")
 '(exec-path (quote ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin" "/usr/local/bin")))
 '(imenu-sort-function (quote imenu--sort-by-name))
 '(inhibit-startup-screen t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(sort-fold-case t)
 '(todo-entry-prefix-function nil)
 '(todo-show-priorities 5)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil \.\.\.)))))
(put 'upcase-region 'disabled nil)
