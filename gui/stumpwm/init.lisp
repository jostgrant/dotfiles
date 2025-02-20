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
        "misc.lisp"
        "apps.lisp")

