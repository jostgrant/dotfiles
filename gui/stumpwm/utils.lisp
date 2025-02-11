(in-package :stumpwm)

(defmacro load-config-files (config-dir &rest files)
  `(progn
     ,@(mapcar (lambda (file)
                 `(load (concat ,config-dir ,file)))
               files)))



(defvar *caffeine-mode* nil "Indicates whether caffeine mode is on or off.")

(defun toggle-caffeine ()
  "Toggle caffeine mode."
  (if *caffeine-mode*
      (progn
        (run-shell-command "xset s on -dpms")
        (run-shell-command "xset s on")
        (setf *caffeine-mode* nil)
        (message "Caffeine mode off"))
      (progn
        (run-shell-command "xset s off -dpms")
        (run-shell-command "xset s off")
        (setf *caffeine-mode* t)
        (message "Caffeine mode on"))))
