;; Mode-line configuration

(in-package :stumpwm)

(setf *contrib-dir* "~/.lisp/misc/stumpwm-contrib")

;;(load-module "disk") ;; doesn't work besides on main machine rn...
(load-module "cpu")
(load-module "mem")
(load-module "net")
(load-module "mpd")
(load-module "battery-portable")

(setf *mode-line-position* :bottom)
(setf *mode-line-screen-position* :bottom)
(setf *mode-line-frame-position* :bottom)
(setf *mode-line-border-width* 0)
(setf *mode-line-background-color* "black")
(setf *mode-line-foreground-color* "grey25")
(setf *mode-line-timeout* 2)
(setf *mode-line-border-color* "grey30")
(setf *window-format* "<%n%s%m%30t>")

(setf *screen-mode-line-format* 
      (list   `(:eval (stumpwm::format-time-string "%a %b %e %k:%M %Y"))
	      " ^6*(^[^n^7*g ^B^5*%u^])^n"
	      " ^6*(^[^n^7*f ^]%g)^n"
	      " ^6*(^[^n^7*w ^]%w)^n"
	      (string #\NewLine)
	      " | D/T:: %d"    
	      " | PWR:: %B" 
	      " | DISK:: %D"
	      " | CPU:: %c %t"
	      " | MEM:: %M"
	      " | NTWRK:: %l"
	      " | VLM:: %V" 
	      (string #\NewLine)
	      " | WTHR:: Saint Louis, Lambert International: "  '(:eval (print-file "/tmp/weather.txt"))
	      " | MAIL::"
	      " | IRC::"
	      " | MEDI:: %m"))

(toggle-mode-line (current-screen) (current-head))

(define-key *root-map* (kbd ",") "mode-line")
