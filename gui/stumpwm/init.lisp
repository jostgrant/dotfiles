;; -*- lisp -*-
;; Main StumpWM config file, loads modular configurations.

(in-package :stumpwm)

;; Define base directory for config files
(defparameter *stumpwm-config-dir* "~/.dots./gui/stumpwm/")

;; Load modular configuration files
(load (concat *stumpwm-config-dir* "core.lisp"))
(load (concat *stumpwm-config-dir* "interface.lisp"))
(load (concat *stumpwm-config-dir* "modeline.lisp"))
(load (concat *stumpwm-config-dir* "keybinds.lisp"))
(load (concat *stumpwm-config-dir* "apps.lisp"))

;; Run necessary startup commands
(run-shell-command "setxkbmap -option ctrl:nocaps")
(apply-screenlayout)
(run-shell-command "exec cd .common/dotfiles/scripts/ && exec ./weather.sh" t)
