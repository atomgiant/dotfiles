; ****************************************
; Miscellaneous settings
; ****************************************
(setq-default abbrev-mode t)          ; Use abbreviations
(setq-default indent-tabs-mode nil)   ; Don't use tabs, only spaces
(setq save-abbrevs t)
; (read-abbrev-file "~/emacs/abbrev_defs")


; ****************************************
; Functions
; ****************************************

(defun bja-atom-date-time ()
  "Return date / time suitably formatted for Atom."
  (concat
   (format-time-string "%Y-%m-%dT%T")
   ((lambda (x)
      (concat (substring x 0 3)
              ":"
              (substring x 3 5)))
    (format-time-string "%z"))))

(defun bja-atom-id (domain)
  "Return a tag-uri for Atom id"
  (concat domain
          ":"
          (format-time-string "%Y-%m-%d:%H%M%S")))

(defun bja-buffer-list ()
  "Display buffer list and move cursor to window."
  (interactive)
  (list-buffers)
  (other-window 1))

(defun bja-buffer-size ()
  "Display the size of the buffer."
  (interactive)
  (message "buffer size %d" (buffer-size)))

(defun bja-case-insensitive-search ()
  "Set case insensitive search"
  (interactive)
  (setq case-fold-search t))

;; From http://xahlee.blogspot.com/2012/06/emacs-commpand-to-copy-rectangle-to.html
(defun copy-rectangle-to-clipboard (p1 p2)
  "Copy region as column (rectangle) to operating system's clipboard.
This command will also put the text in register 0. (see: `copy-to-register')"
  (interactive "r")
  (copy-rectangle-to-register ?0 p1 p2)
  (kill-new
   (with-temp-buffer
     (insert-register ?0)
     (buffer-string))))

(defun bja-degree ()
  "Insert a degree symbol into the buffer."
  (interactive)
  (ucs-insert "ba"))

(defun bja-delete-one-line ()
  "Delete current line e.g. vim's dd"
  (interactive)
  (let (previous-column (current-column))
    (setq previous-column (current-column))
    (kill-whole-line 1)
    (move-to-column previous-column)))

(defun bja-diary ()
  "Display diary events for the next 30 days."
  (interactive)
  (diary 30))

(defun bja-duplicate-line ()
  "Duplicate current line"
  (interactive)
  (save-excursion
    (kill-whole-line 1)
    (beginning-of-line)
    (yank)
    (yank))
  (next-line))

(defun bja-fold ()
  "Dummy function to have 'fold' in the name for searchability. See bja-selective-display"
  (interactive)
  (message "Use bja-selective-display"))

(defun bja-grudem ()
  "Display the day of the year and current page in Grudem's Systematic Theology"
  (interactive)
  (let ((days (days-between (current-time-string) "Dec 31 00:00:00 EST 2007")))
    (message "Day of year is %d, current page is %f" days (+ 20 (* 3.14 days)))))

;; Got the font-size-decrease/increase functions from Alan Dipert alan@dipert.org
(defun bja-font-size-decrease ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                (face-attribute 'default :height)))))

(defun bja-font-size-increase ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))

(defun bja-font-size-reset ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      120))

(defun bja-insert-atom-entry ()
  "Create a new Atom entry. Prompts for various fields and then
constructs an Atom <entry> element."
  (interactive)
  (let ((title nil) 
        (domain nil) 
        (link nil) 
        (summary nil) 
        (content nil) 
        (category nil))
    (save-excursion
      (setq title    (read-from-minibuffer "Title: "))
      (setq domain   (read-from-minibuffer "Domain: "))
      (setq link     (read-from-minibuffer "Link: "))
      (setq summary  (read-from-minibuffer "Summary: "))
      (setq content  (read-from-minibuffer "Content: "))
      (setq category (read-from-minibuffer "Category: ")))
    (insert "  <entry>\n"
            "    <title>" title "</title>\n"
            "    <id>" (bja-atom-id domain) "</id>\n"
            "    <updated>" (bja-atom-date-time) "</updated>\n"
            "    <link href=\"" link "\"/>\n"
            "    <summary>" summary "</summary>\n"
            "    <content type=\"html\">\n"
            "      <![CDATA[ " content "]]>\n"
            "    </content>\n"
            "    <category term=\"" category "\"/>\n"
            "  </entry>\n\n")))

(defun bja-match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun bja-max-frame-dell ()
  "Maximizes the frame for the Dell monitor at work"
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 237 66))

(defun bja-open-peer ()
  "Set left window to document and right window to document's directory"
  (interactive)
  (delete-other-windows)
  (split-window-right)
  (other-window 1)
  (dired-jump))

(defun bja-sub-max-frame-dell ()
  "Make the frame slightly smaller than max to avoid burn in"
  (interactive)
  (set-frame-position (selected-frame) 12 44)
  (set-frame-size (selected-frame) 233 63))

(defun bja-max-frame-macbook ()
  "Maximizes the frame for the Macbook Pro"
  (interactive)
  (set-frame-position (selected-frame) 0 22)
  (set-frame-size (selected-frame) 202 56))

(defun bja-mysql-align ()
  "Invokes two keyboard macros to align column definitions in MySQL."
  (interactive)
  ; save-excuresion allows restoring the region after the first 
  ; macro invocation
  (save-excursion
    (bja-mysql-align-col-types))
  (bja-mysql-align-remainder))

(defun bja-open-line-above ()
  "Simulation of Vim's O command to open a line above the cursor"
  (interactive)
  (beginning-of-line)
  (open-line 1)
  (indent-according-to-mode))

(defun bja-open-line-below ()
  "Simulation of Vim's o command to open a line below the cursor"
  (interactive)
  (end-of-line)
  (open-line 1)
  (next-line 1)
  (indent-according-to-mode))

(defun bja-precede-with-bang ()
  "Precede current text with a bang !"
  (interactive)
  (search-backward " ")
  (forward-char)
  (insert "!")
  (move-end-of-line 1))

(defun bja-replace-region ()
  "Replace a selected region with text from the clipboard"
  (interactive)
  (kill-region (point) (mark))
  (yank)
  (setq last-command 'yank)
  (yank-pop))

(defun bja-report-time ()
  "Produce timeclock report. Accepts a begin date and regex filter string."
  (interactive)
  (let ((today (format-time-string "%m/%d/%Y")))
    (shell-command 
     (concat "timeclock.rb -g 1 -b "
             (completing-read (format "Begin date (default %s): " today)
                              (list today (format-time-string "%m/01/%Y"))
                              nil nil nil nil today)
             " "
             (completing-read "Enter filter (default \"\"): "
                              '("\"^GospelSoftware\"" "\"^Netlojic\"" "\"^Lojic\"")
                              nil nil nil nil "\"\"")
             " < ~/emacs/timelog"))))
;  (switch-to-buffer "*Shell Command Output*"))

(defun bja-scroll-down-1 ()
  "Scroll text down 1 line"
  (interactive)
  (scroll-down 1))

(defun bja-scroll-line-to-top ()
  "Scroll the current line to the top of the window. Similar to vim's zt"
  (interactive)
  (recenter-top-bottom 0))

(defun bja-scroll-up-1 ()
  "Scroll text up 1 line"
  (interactive)
  (scroll-up 1))

(defun bja-selective-display ()
  "Increase selective-display 2 columns at a time. Use
set-selective-display (bound to C-x $) with no arg to clear. This
can be used to get some of the benefits of folding."
  (interactive)
  (set-selective-display 
   (+ (or selective-display 
          2) 
      2)))

(defun bja-split-4 ()
  "Split horizontally, then split each window vertically"
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-vertically)
  (other-window 2)
  (split-window-vertically)
  (other-window 2)) 

(defun bja-sunrise ()
  "Display sunrise, sunset & twilight information."
  (interactive)
  (shell-command "sunrise_http_post.rb"))

(defun bja-timelog-hierarchy (depth)
  "Display a hierarchical view of time category tags"
  (interactive (list (read-from-minibuffer "Depth: " "2")))
  (shell-command (format "timelog_tree.rb %s < ~/emacs/timelog" depth)))
                              
(defun bja-underline-with-char (char)
  "Underline the current line with a character"
  (interactive (list (read-from-minibuffer "Char: ")))
  (when (= 0 (length char))
    (error "Need a character"))
  (setq char (aref char 0))             ; Ignore everything but the first char.
  (save-excursion
    (goto-char (point-at-eol))
    (insert "\n"
            (make-string (- (point-at-eol)
                            (point-at-bol))
                         char))))

(defun bja-update-gs-hours ()
  "Update my GospelSoftware hours on the cari.net server via a Ruby script
that handles the scp, etc."
  (interactive)
  (shell-command "update_gs_hours.rb"))

(defun bja-update-schedule ()
  "Update my schedule on the family web site."
  (interactive)
  (diary 90)
  (switch-to-buffer "*Fancy Diary Entries*")
  (write-file "/home/brian/temp/schedule.txt")
  (kill-buffer "schedule.txt")
  (shell-command "update_ba_schedule.rb"))

(defun bja-zap-to-char (arg char)
  "Kill up to, but not including ARG'th occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
May not work well with negative arg."
  (interactive "p\ncZap to char: ")
  (if (char-table-p translation-table-for-input)
      (setq char (or (aref translation-table-for-input char) char)))
  (kill-region (point) (progn
			 (search-forward (char-to-string char) nil nil arg)
                         ; backup one char - this is the only diff from built-in
                         (backward-char 1)
			 (point))))


; ****************************************
; Keyboard macros
; ****************************************

(fset 'bja-align-assignment-region
   (lambda (&optional arg) 
     "Keyboard macro to invoke align-regex and supply '=' for the
regular expression to align a set of assignment lines." 
     (interactive "p") 
     (kmacro-exec-ring-item 
      (quote ([134217848 97 108 105 103 110 45 114 101 103 101 120 return 61 return] 0 "%d"))
      arg)))

(fset 'bja-mysql-align-col-types
   (lambda (&optional arg) 
     "Keyboard macro to align column types in a MySQL file. Select a region first." 
     (interactive "p") 
     (kmacro-exec-ring-item (quote ([21 134217848 97 108 105 103 110 45 114 101 103 101 120 112 return left left left backspace backspace 46 6 91 96 93 5 92 40 91 32 93 92 41 return backspace 50 return return 110] 0 "%d")) arg)))

(fset 'bja-mysql-align-remainder
   (lambda (&optional arg) 
     "Keyboard macro to align the remainder of the line following the column
type. Select region first."
     (interactive "p")
     (kmacro-exec-ring-item (quote ([21 134217848 97 108 105 103 110 45 114 101 103 101 120 112 return 2 2 2 2 2 2 4 4 4 4 46 42 91 96 93 91 32 93 43 91 94 32 93 43 5 92 40 91 32 93 92 41 return backspace 50 return return 110] 0 "%d")) arg)))


; ****************************************
; Key bindings
; ****************************************

(global-set-key "%" 'bja-match-paren)
(global-set-key (kbd "C-c !") 'bja-precede-with-bang)
(global-set-key (kbd "C-c +") 'bja-font-size-increase)
(global-set-key (kbd "C-c -") 'bja-font-size-decrease)
(global-set-key (kbd "C-c 0") 'bja-font-size-reset)
(global-set-key (kbd "C-c 4") 'bja-split-4)
(global-set-key (kbd "C-c =") 'calc-grab-sum-down)
(global-set-key (kbd "C-c a") 'bja-align-assignment-region)
(global-set-key (kbd "C-c C-l") 'bja-delete-one-line)
(global-set-key (kbd "C-c d") 'ediff-revision)
(global-set-key (kbd "C-c l") 'bja-duplicate-line)
(global-set-key (kbd "C-c M") 'bja-max-frame-dell)
(global-set-key (kbd "C-c m") 'bja-max-frame-macbook)
(global-set-key (kbd "C-c N") 'bja-sub-max-frame-dell)
(global-set-key (kbd "C-c s") 'bja-selective-display)
(global-set-key (kbd "C-c t") 'twit-post)
(global-set-key (kbd "C-c u") 'bja-underline-with-char)
(global-set-key (kbd "C-c y") 'bja-replace-region)
(global-set-key (kbd "C-M-g") 'goto-line)
(global-set-key (kbd "C-o") 'bja-open-line-below)
(global-set-key (kbd "C-S-n") 'bja-scroll-up-1)
(global-set-key (kbd "C-S-p") 'bja-scroll-down-1)
(global-set-key (kbd "C-x c") 'calendar)
(global-set-key (kbd "C-x C-b") 'bja-buffer-list)
(global-set-key (kbd "C-x j") (lambda() (interactive) (next-line) (join-line)))
(global-set-key (kbd "C-x p") 'bja-open-peer)
(global-set-key (kbd "C-x t") 'todo-show)
(global-set-key (kbd "M-f") 'forward-to-word)
(global-set-key (kbd "M-g t") 'bja-scroll-line-to-top)
(global-set-key (kbd "M-h") 'ns-do-hide-emacs)
(global-set-key (kbd "M-n") 'next-line)
(global-set-key (kbd "M-o") 'bja-open-line-above) 
(global-set-key (kbd "M-p") 'previous-line)
(global-set-key (kbd "M-z") 'bja-zap-to-char)
(global-set-key [S-f3] 'desktop-clear)
(global-set-key [f4] (lambda ()
                         (interactive)
                         (timeclock-change nil (timeclock-ask-for-project))
                         (timeclock-reread-log) 
                         (message (timeclock-status-string nil t))))
(global-set-key [f5] (lambda ()
                       (interactive)
                       (timeclock-in nil nil t)
                       (timeclock-reread-log) 
                       (message (timeclock-status-string nil t))))
(global-set-key [f6] (lambda () 
                       (interactive)
                       (timeclock-out nil nil nil)
                       (timeclock-reread-log) 
                       (message (timeclock-status-string nil t))))
(global-set-key [f7] (lambda () 
                       (interactive) 
                       (timeclock-reread-log) 
                       (message (timeclock-status-string nil t))))
(global-set-key [S-f7] (lambda () 
                       (interactive) 
                       (timeclock-visit-timelog)
                       (end-of-buffer)))

; The following 2 lines allow me to use space in the minibuffer 
; while autocompleting and not have the space attempt to autocomplete.
; One person suggested the following 2 commented out lines, but another
; mentioned it's better to unmap by setting to nil, that seems to work fine
;(define-key minibuffer-local-completion-map " " 'self-insert-command)
;(define-key minibuffer-local-must-match-map " " 'self-insert-command) 
(define-key minibuffer-local-completion-map " " nil)
(define-key minibuffer-local-must-match-map " " nil)

;; Set case insensitive search
(bja-case-insensitive-search)
