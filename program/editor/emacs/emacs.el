;; A VERY old & VERY short version of my old Emacs config salvaged from a near 15 y/o laptop drive!
;; Rest is sadu; gone to time, but this is an interesting snapshot of the start of my relationship
;; in / with LISP , which I still consider my 'first real programming love'.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (wombat)))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(fci-rule-color "#eee8d5")
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Terminus" :foundry "xos4" :slant normal :weight normal :height 105 :width normal)))))

(ido-mode 1)

;; Fullscreen ---------------------------------------------------------------------
(defun toggle-fullscreen (&optional f)
  (interactive)
    (let ((current-value (frame-parameter nil 'fullscreen)))
          (set-frame-parameter nil 'fullscreen
	      (if (equal 'fullboth current-value)
              (if (boundp 'old-fullscreen) old-fullscreen nil)
              (progn (setq old-fullscreen current-value)
                    'fullboth)))))

(global-set-key [f11] 'toggle-fullscreen)
; Make new frames fullscreen by default. Note: this hook doesn't do
; anything to the initial frame if it's in your .emacs, since that file is
; read _after_ the initial frame is created.
(add-hook 'after-make-frame-functions 'toggle-fullscreen)

;; Set Frame/Window Managment -----------------------------------------------------
(global-set-key (kbd "C-x 5 n") 'set-frame-name)
(global-set-key (kbd "C-x 5 C-b") 'set-frame-by-name)
(global-set-key (kbd "C-x ^") 'windresize)
(global-set-key (kbd "C-' p") 'windmove-up)
(global-set-key (kbd "C-' n ") 'windmove-down)
(global-set-key (kbd "C-' b") 'windmove-left)
(global-set-key (kbd "C-' f") 'windmove-right)

;; Set package repo ---------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; W3M/conkeror default-browser --------------------------------------------------
(require 'w3m-load)
(require 'w3m)
 (setq browse-url-browser-function 'browse-url-generic
       browse-url-generic-program "/usr/bin/conkeror")

(defun choose-browser (url &rest args)
  (interactive "sURL: ")
  (if (y-or-n-p "Use external browser? ")
      (browse-url-generic url)
    (w3m-browse-url url)))

(setq browse-url-browser-function 'choose-browser)
(global-set-key "\C-xm" 'browse-url-at-point)

;; EMMS ------------------------------------------------------------------------ 
(require 'emms-setup)
(emms-all)
(emms-default-players)
;; Show the current track each time EMMS
;; starts to play a track with "NP : "
(add-hook 'emms-player-started-hook 'emms-show)
(setq emms-show-format "NP: %s")
;; When asked for emms-play-directory,
;; always start from this one 
(setq emms-source-file-default-directory "~/DESKTOP/library/audio/music")
;; Want to use alsa with mpg321 ? 
(setq emms-player-mpg321-parameters '("-o" "alsa"))
;;keybindings

(global-set-key (kbd "C-<XF86AudioRaiseVolume>") 'emms-raise-volume)
(global-set-key (kbd "C-<XF86AudioLowerVolume>") 'emms-raise-lower)
(global-set-key (kbd "C-c e p") 'emms-previous)
(global-set-key (kbd "C-c e n") 'emms-next)
(global-set-key (kbd " C-c e SPC") 'emms-pause)
(global-set-key (kbd "<f2>") 'emms-smart-browse)

;; Erc autojoin ------------------------------------------------------------------
(erc :server "irc.freenode.net" :nick "" :password "")
(setq erc-autojoin-channels-alist 
'(("freenode.net" "#freenode" "#gnu" "#fsf" "#gnome" "#emacs" "#org-mode" "##unix"
    "#autotools" "#gcc"" ##c" "#xorg" "#wayland" "#archlinux")))


