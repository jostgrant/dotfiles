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


(defparameter *session-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "r") "reinit")
    (define-key m (kbd "t") "toggle-touchpad")
    (define-key m (kbd "b") "show-battery")
    (define-key m (kbd "v") "version")
    (define-key m (kbd "SunPrint_Screen") "exec scrot '%Y-%m-%d_$wx$h_scrot.png' -e 'mv $f ~/PERSONAL/Visual/Screenshots/'")
    (define-key m (kbd "S") "exec systemctl suspend")
    (define-key m (kbd "l") "exec light-locker-command --lock")
    (define-key m (kbd "c") "caffeine")
    (define-key m (kbd "q") "quit")
    m))

(define-key *root-map* (kbd "s") '*session-map*)

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
(define-key *top-map* (kbd "XF86MonBrightnessUp") "exec xbacklight -inc 10")
(define-key *top-map* (kbd "XF86MonBrightnessDown") "exec xbacklight -dec 10")

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
;; MEDIA CONTROL
;; -------------------------------

(defcommand show-current-song () ()
  (let ((output (run-shell-command "playerctl metadata --format 'Now playing: {{artist}} - {{title}}'" t)))
    (message output)))

(defparameter *media-map*
  (let ((m (make-sparse-keymap)))
    (define-key m (kbd "p") "exec playerctl play-pause")
    (define-key m (kbd "n") "exec playerctl next")
    (define-key m (kbd "b") "exec playerctl previous")
    (define-key m (kbd "s") "exec playerctl stop")

    ;; Volume controls
    (define-key m (kbd "i") "exec playerctl volume 0.05+")
    (define-key m (kbd "d") "exec playerctl volume 0.05-")
    (define-key m (kbd "m") "exec playerctl volume 0")  ;; Mute

    (define-key m (kbd "S") "exec playerctl shuffle toggle")
    (define-key m (kbd "R") "exec playerctl loop toggle")

    (define-key m (kbd "f") "exec playerctl position 10+")
    (define-key m (kbd "r") "exec playerctl position 10-")

    (define-key m (kbd "I") "show-current-song")
    m))

(define-key *root-map* (kbd "m") '*media-map*)
