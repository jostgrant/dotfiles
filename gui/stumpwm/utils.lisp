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






(defmacro run-if-hostname (hostnames &body body)
  "Run the body if the current hostname matches any of the given hostnames."
  `(when (member (machine-instance) (list ,@hostnames) :test 'string=)
     ,@body))

(defmacro run-if-username (usernames &body body)
  "Run the body if the current username matches any of the given usernames."
  `(when (member (sb-ext:posix-getenv "USER") (list ,@usernames) :test 'string=)
     ,@body))





