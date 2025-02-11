;; Application shortcuts

(in-package :stumpwm)

(defcommand texteditor () ()
  (run-or-raise "emacs" '(:instance "emacs")))

(defcommand webbrowser () ()
  (run-or-raise "nyxt" '(:instance "Navigator")))

(defcommand termemu () ()
  (run-or-raise "st" '(:instance "st")))

(defcommand paint () ()
  (run-or-raise "mypaint" '(:instance "mypaint")))

(defparameter *application-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "e") "texteditor")
    (define-key m (kbd "w") "webbrowser")
    (define-key m (kbd "t") "termemu")
    (define-key m (kbd "p") "paint")
    (define-key m (kbd "K") "exec xkill")  
    m))

(define-key *root-map* (kbd "a") '*application-map*)
