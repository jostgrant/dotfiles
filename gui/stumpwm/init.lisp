;; -*- lisp -*-
(in-package :stumpwm)
(load "~/.dots./gui/stumpwm/utils.lisp")

(defparameter *stumpwm-config-dir* 
              "~/.dots./gui/stumpwm/")

(load-config-files 
    *stumpwm-config-dir*
        "core.lisp"
        "cmds.lisp"
        "interface.lisp"
        "modeline.lisp"
        "keybinds.lisp"
        "specific.lisp"
        "apps.lisp")

;; Day-To-Day Workstaiton.
(run-if-hostname ("MELCHIOR" "CASPER")
  (progn (sleep 0)))

;; Main And Backup Laptop.
(run-if-hostname ("BALTHASAR" "WILLESS")
  (run-shell-command ""))

;; Treadmill-Desk Laptop.
(run-if-hostname ("NERVESS")
  (run-shell-command ""))

;; Repurposed Ultrabooks (Smart-Clocks).
(run-if-hostname ("OPTIMEX" "PRIMER" "MEGATON")
  (run-shell-command ""))

;; Media-Center / HTPC.
(run-if-hostname ("MEDIAN")
  (run-shell-command ""))

;; Bed-Room Machines.
(run-if-hostname ("DOOM" "LOOM")
  (run-shell-command ""))

;; Home & Offsite Servers.
(run-if-hostname ("0NSIGHT" "1NSIGHT")
  (run-shell-command ""))

(run-if-username ("MACHIN")
  (run-shell-command ""))
