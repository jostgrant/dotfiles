(in-package :stumpwm)

(defcommand reinit () ()
  (run-commands "reload" "loadrc"))

(defcommand show-battery () ()
   (echo-string (current-screen) (run-shell-command "acpi" t)))

(defcommand toggle-touchpad () ()
  "Toggle the laptop touchpad on/off."
  (let ((state (run-shell-command
                "synclient -l | grep TouchpadOff | awk '{ print $3 }'" t)))
    (case (string= (subseq state 0 1) "1")
      (t (shell-command "synclient TouchpadOff=0"))
      (otherwise (shell-command "synclient TouchpadOff=1")
                 (banish-pointer)))))

(defcommand caffeine () ()
  (toggle-caffeine))
