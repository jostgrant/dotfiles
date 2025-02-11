;; Keybindings for StumpWM

(in-package :stumpwm)

(set-prefix-key (kbd "C-quoteright"))

;; -------------------------------
;; WINDOW MANAGEMENT
;; -------------------------------

(defparameter *window-operate-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "n") "move-focus down")
    (define-key m (kbd "p") "move-focus up")
    (define-key m (kbd "b") "move-focus left")
    (define-key m (kbd "f") "move-focus right")

    (define-key m (kbd "C-n") "move-window down")
    (define-key m (kbd "C-p") "move-window up")
    (define-key m (kbd "C-b") "move-window left")
    (define-key m (kbd "C-f") "move-window right")

    (define-key m (kbd "k") "remove")
    (define-key m (kbd "0") "remove")
    m))

(define-key *root-map* (kbd "w") '*window-operate-map*)

;; -------------------------------
;; FRAME MANAGEMENT
;; -------------------------------

(defparameter *frame-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "3") "hsplit")
    (define-key m (kbd "2") "vsplit")
    (define-key m (kbd "1") "only")
    (define-key m (kbd "0") "remove")
    (define-key m (kbd "r") "resize")

    (define-key m (kbd "f") "fnext")
    (define-key m (kbd "b") "fother")
    (define-key m (kbd "s") "fselect")
    m))

(define-key *root-map* (kbd "f") '*frame-map*)

;; -------------------------------
;; GROUP MANAGEMENT
;; -------------------------------

(defparameter *group-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "n") "gnew")
    (define-key m (kbd "N") "gnew-float")
    (define-key m (kbd "b") "gnewbg")
    (define-key m (kbd "B") "gnewbg-float")

    (define-key m (kbd "f") "gnext")
    (define-key m (kbd "b") "gprev")

    (define-key m (kbd "m") "gnmerge")
    (define-key m (kbd "s") "gselect")
    (define-key m (kbd "v") "gmove")
    (define-key m (kbd "k") "gkill")
    (define-key m (kbd "r") "grename")
    (define-key m (kbd "l") "grouplist")
    m))

(define-key *root-map* (kbd "g") '*group-map*)

;; -------------------------------
;; SESSION MANAGEMENT
;; -------------------------------

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

(defparameter *session-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "r") "reinit")
    (define-key m (kbd "t") "toggle-touchpad")
    (define-key m (kbd "b") "show-battery")
    (define-key m (kbd "v") "version")
    (define-key m (kbd "SunPrint_Screen") "exec scrot '%Y-%m-%d_$wx$h_scrot.png' -e 'mv $f ~/PERSONAL/Visual/Screenshots/'")
    (define-key m (kbd "S") "exec systemctl suspend")
    (define-key m (kbd "l") "exec light-locker-command --lock")
;;  (define-key m (kbd "c") "caffeine")
    (define-key m (kbd "q") "quit")
    m))

(define-key *root-map* (kbd "s") '*session-map*)

;; -------------------------------
;; VOLUME CONTROL
;; -------------------------------

(defparameter *volume-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "m") "exec amixer --quiet set Master toggle")
    (define-key m (kbd "i") "exec amixer --quiet set Master 10+")
    (define-key m (kbd "d") "exec amixer --quiet set Master 10-")
    m))

; Hardware keys for volume control
(define-key *top-map* (kbd "XF86AudioRaiseVolume") "exec amixer --quiet set Master 5+")
(define-key *top-map* (kbd "XF86AudioLowerVolume") "exec amixer --quiet set Master 5-")
(define-key *top-map* (kbd "XF86AudioMute") "exec amixer --quiet set Master toggle")

(define-key *root-map* (kbd "v") '*volume-map*)

;; -------------------------------
;; DISPLAY CONTROL
;; -------------------------------

(defparameter *display-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "z") "exec xbacklight -set 0")
    (define-key m (kbd "f") "exec xbacklight -set 100")
    (define-key m (kbd "i") "exec xbacklight -inc 30")
    (define-key m (kbd "d") "exec xbacklight -dec 30")

    (define-key m (kbd "r") "exec xrandr --auto")
    (define-key m (kbd "F") "exec xrandr --output LVDS1 --off")
    (define-key m (kbd "N") "exec xrandr --output LVDS1 --on")
    m))

(define-key *root-map* (kbd "d") '*display-map*)
