;; -*- lisp -*-
(in-package :stumpwm)





(defmacro load-config-files (config-dir &rest files)
  `(progn
     ,@(mapcar (lambda (file)
                 `(load (concat ,config-dir ,file)))
               files)))




(defparameter *stumpwm-config-dir* "~/.dots./gui/stumpwm/")

(load-config-files *stumpwm-config-dir*
                   "core.lisp"
                   "cmds.lisp"
                   "interface.lisp"
                   "modeline.lisp"
                   "keybinds.lisp"
                   "specific.lisp"
                   "utils.lisp"
                   "apps.lisp")

