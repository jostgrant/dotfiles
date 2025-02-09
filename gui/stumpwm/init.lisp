;; -*- lisp -*-
(in-package :stumpwm)

(defun machine-name ()
  "Retrieve the machine's hostname."
  (string-trim '(#\Newline) (run-shell-command "hostname" t)))

(defparameter *workstation-machines* '("BALTHASAR" "CASPER" "MELCHIOR" "NERVESS" "WILLESS"))
(defparameter *ttymer-machines* '("OPTIMEX" "PRIMER" "MEGATON"))

(defparameter *workstation-config* "~/.dots./gui/stumpwm/conf/pack/workstation.lisp")
(defparameter *ttymer-config* "~/.dots./gui/stumpwm/conf/pack/ttymer.lisp")

;; Load config based on hostname.
(cond
  ((member (machine-name) *workstation-machines* :test #'string=)
   (load *workstation-config*))
  ((member (machine-name) *ttymer-machines* :test #'string=)
   (load *ttymer-config*))
  (t
   (format t "No specific configuration found for this machine.~%")))
