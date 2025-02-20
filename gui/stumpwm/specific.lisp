;; Day-To-Day Workstaiton.
(run-if-hostname ("MELCHIOR" "CASPER")
  (progn (sleep 0)))

(run-if-hostname ("MELCHIOR")
  (run-shell-command ""))

(run-if-hostname ("CASPER")
  (run-shell-command ""))





;; Main And Backup Laptop.
(run-if-hostname ("BALTHASAR" "WILLESS")
  (run-shell-command ""))

(run-if-hostname ("BALTHASAR")
  (run-shell-command ""))

(run-if-hostname ("WILLESS")
  (run-shell-command ""))





;; Treadmill-Desk Laptop.
(run-if-hostname ("NERVESS")
  (run-shell-command ""))





;; Repurposed Ultrabooks (Smart-Clocks).
(run-if-hostname ("OPTIMEX" "PRIMER" "MEGATON")
  (run-shell-command ""))

(run-if-hostname ("OPTIMEX")
  ;; Flip input of 'FTSC100:00 2808:5116' (Touchscreen).
  (run-shell-command "xinput set-prop 14 'Coordinate Transformation Matrix' -1 0 1 0 -1 1 0 0 1"))

(run-if-hostname ("PRIMER")
  ;; Flip input of ELAN Touchscreen.
  (run-shell-command "xinput set-prop 13 'Coordinate Transformation Matrix' -1 0 1 0 -1 1 0 0 1"))

;; Make sure ontime is launched on login.
(run-if-hostname ("MEGATON")
  (run-shell-command ""))




;; Media-Center / HTPC.
(run-if-hostname ("MEDIAN")
   (run-or-raise "~/.appimg/ontime/run.pkg" '(:instance "ontime")))






;; Bed-Room Machines.
(run-if-hostname ("DOOM" "LOOM")
  (run-shell-command ""))

(run-if-hostname ("DOOM")
  (run-shell-command ""))

(run-if-hostname ("LOOM")
  (run-shell-command ""))





;; Home & Offsite Servers.
(run-if-hostname ("0NSIGHT" "1NSIGHT")
  (run-shell-command ""))





(run-if-username ("MACHIN")
  (run-shell-command ""))
