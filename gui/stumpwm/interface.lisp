;; Appearance settings

(in-package :stumpwm)

(run-shell-command "feh --bg-scale ~/.wall.jpg")
(set-font "-xos4-terminus-medium-r-normal--14-*-*-*-*-*")

(setf *startup-message* nil)
(setf *startup-message* "ello 'orld")


(setf *normal-border-width* 0)
(setf *maxsize-border-width* 0)
(setf *transient-border-width* 0)

(defparameter FOREGROUND-COLOR "green")
(defparameter BACKGROUND-COLOR "black")
(defparameter BORDER-COLOR "green")

;; Window border colors.
(set-focus-color "dimgray")
(set-unfocus-color "grey10")
(set-win-bg-color "black")
(set-float-focus-color "black")
(set-float-unfocus-color "grey")

(setf *window-border-style* :thin)
(set-normal-gravity :bottom)
(set-maxsize-gravity :center)
(set-transient-gravity :center)

;; Input box colors
(set-bg-color BACKGROUND-COLOR)
(set-fg-color "forestgreen")
(set-border-color "grey16")
(set-msg-border-width 0)
(setf *input-window-gravity* :bottom-right)

; WINDOWS
(setf *maxsize-border-width* 0)
(set-frame-outline-width 1)
(set-normal-gravity :center)
(setf *normal-border-width* 1)
(setf *window-border-style* :thin) ; thick,thin,none,tight

; message window, input window
(setf *message-window-gravity* :bottom-right)
