;; Send Growl notification
;; Requires one time registration with following AppleScript script:
;; tell application "GrowlHelperApp"
;; 	-- Declare a list of notification types
;; 	set the allNotificationsList to {"Emacs Notification"}
	
;; 	-- Declare list of active notifications.  If some of them
;; 	-- isn't activated, user can do this later via preferences
;; 	set the enabledNotificationsList to {"Emacs Notification"}
	
;; 	-- Register our application in Growl.
;; 	register as application "Emacs.app" all notifications allNotificationsList default notifications enabledNotificationsList icon of application "Emacs.app"
;; end tell
(defun bja-growl-notification (title message &optional sticky)
  "Send a Growl notification"
  (do-applescript 
   (format "tell application \"GrowlHelperApp\"
              notify with name \"Emacs Notification\" title \"%s\" description \"%s\" application name \"Emacs.app\" sticky %s
           end tell" 
           title 
           (replace-regexp-in-string "\"" "''" message)
           (if sticky "yes" "no")))
  (bja-play-cowbell))

(defun bja-growl-timer (minutes message)
  "Issue a Growl notification after specified minutes.

The variable timer-list will contain the list of active timers."
  (interactive (list (read-from-minibuffer "Minutes: " "10") 
                     (read-from-minibuffer "Message: " "") ))
  (run-at-time (* (string-to-number minutes) 60) 
               nil 
               (lambda (message)
                 (bja-growl-notification "Emacs Reminder" message t))
               message))

(defun bja-cancel-last-timer ()
  "Cancel the last timer in the timer-list."
  (interactive)
  (cancel-timer (car (last timer-list))))
