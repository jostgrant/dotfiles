;; Core StumpWM settings

(in-package :stumpwm)

(defun print-file (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (format nil "~:(~a~)" (read in)))))

(defun apply-screenlayout ()
  (when (probe-file "~/.screenlayout/default.sh")
    (run-shell-command "sh ~/.screenlayout/default.sh")))

(apply-screenlayout)

(run-shell-command "setxkbmap -option ctrl:nocaps")
(run-shell-command "xset s off -dpms")
(run-shell-command "xset s off")

(run-shell-command "light-locker &")

(run-shell-command "exec cd .common/dotfiles/scripts/ && exec ./weather.sh" t)

;; suppress the message StumpWM displays when it starts. Set it to NIL
(setf *startup-message* nil)
(setf *startup-message* "ello 'orld")

