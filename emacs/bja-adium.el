;; Some functions to set Adium status

(defun bja-adium-applescript-status (msg)
  "format an applescript string to set Adium status"
  (concat "tell application \"Adium\" to go " msg))

(defun bja-adium-away (msg)
  "Set Adium status on Mac OSX to away with optional message"
  (interactive (list (read-from-minibuffer "Msg: " "Away")))
  (do-applescript 
   (bja-adium-applescript-status 
    (concat "away with message \"" msg "\""))))

(defconst bja-adium-available-msg "Available")

(defun bja-adium-available (msg)
  "Set Adium status on Mac OSX to available w/ an optional message"
  (interactive (list (read-from-minibuffer "Msg: " bja-adium-available-msg)))
  (do-applescript 
   (bja-adium-applescript-status 
    (if (string= msg bja-adium-available-msg) 
        "available"
        (concat "available with message \"" msg "\"")))))
  

;; (defun adium-test ()
;;   (interactive)
;;   (do-applescript (format "
;;     tell application \"Adium\"
;;       tell account \"lojicdotcom@gmail.com\" to set theChat to make new chat with contacts {contact \"smoonen@gmail.com\"} with new chat window
;;       send theChat message \"did you get this from Emacs?\"
;;       close theChat
;;     end tell")))

;; (defun adium-test ()
;;   (interactive)
;;   (do-applescript (format "
;;     tell application \"Adium\"
;;       tell account \"odjfs2001\" to set theChat to make new chat with contacts { contact \"goalinmind\" } with new chat window
;;       send theChat message \"another test\"
;;     end tell")))

