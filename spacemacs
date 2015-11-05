;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     ;; (git :variables
     ;;      git-gutter-use-fringe t)
     (git :variables
          git-magit-status-fullscreen t
          git-enable-github-support t
          git-gutter-use-fringe t)
     osx
     markdown
     org
     syntax-checking
     ess
     python
     clojure
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         leuven
                         solarized-dark
                         solarized-light
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
 (setq-default dotspacemacs-default-font '("Source Code Pro"
                                          :size 13
                                          :weight normal
                                          :width normal
                                          :powerline-scale 1.1))
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (global-evil-search-highlight-persist 0)
  (evil-search-highlight-persist 0)
  )


(setq org-deadline-warning-days 14)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-directory "~/Documents/Org")
(setq org-default-notes-file "~/Documents/Org/hsph.org")
(setq org-todo-keywords
      '((sequence
         "TODO(t)"
         "WAITING(w)"
         "SOMEDAY(.)"
         "|" "DONE(x!)" "CANCELLED(c@)")
        (sequence "NEXT(n)"
                  "|" "DONE(x!)" "CANCLELLED(c@)")
        (sequence "MEET(m)" "|" "COMPLETE(x)")
        (sequence "BUG(b)" "|" "FIXED(f)")
        (sequence "READ(r)" "|" "DONE(x!)")
        (sequence "TODELEGATE(-)" "DELEGATED(d)" "COMPLETE(x)")))

;; catch invisible edits
(setq org-catch-invisible-edits t)

;; stuff for GTD
(setq org-agenda-custom-commands
      '(("W" "Weekly Review"
         ((agenda "" ((org-agenda-span 7)
                      (org-agenda-start-day "-7d")
                      (org-agenda-entry-types '(:timestamp))
                      (org-agenda-show-log t)))
          (stuck "")
          (todo "TODO")  ;; review what is next
          (todo "WAITING") ;; projects we are waiting on
          (tags "PROJECT") ;; review all projects
          (tags "SOMEDAY"))) ;; review someday/maybe items

        ("D" "Daily review"
         ((agenda "" ((org-agenda-ndays 7)))
          (todo "NEXT")
          (todo "DELEGATED|WAITING") ;; projects we are waiting on
          (tags "@inbox")
          (stuck "")
          (tags "@errand")))))

(setq org-stuck-projects
        '("+@project/-MAYBE-DONE" ("NEXT" "WAITING") ("@SHOP")
          "\\<IGNORE\\>"))
(setq org-tags-exclude-from-inheritance '("@project"))
(setq org-agenda-files '("~/Documents/Org/hsph.org"
                         "~/Documents/Org/social.org"
                         "~/Documents/Org/inbox.org"))
(setq org-icalendar-combined-agenda-file "~/Dropbox/Public/hsph.ics")
(setq org-icalendar-alarm-time 60)
(setq org-agenda-default-appointment-duration 60)

(setq org-refile-targets
      '(("~/Documents/Org/hsph.org" :maxlevel . 1)))

;; Needs terminal-notifier (brew install terminal-notifier)
(defun notify-osx (title message)
  (call-process "terminal-notifier"
                nil 0 nil
                "-group" "Emacs"
                "-title" title
                "-sender" "org.gnu.Emacs"
                "-message" message))

(defvar roryk-org-sync-timer nil)

(defvar roryk-org-sync-secs (* 60 20))

(defun roryk-org-sync ()
  (org-icalendar-combine-agenda-files)
  (notify-osx "Emacs (org-mode)" "iCal sync completed."))

(defun roryk-org-sync-start ()
  "Start automated org-mode syncing"
  (interactive)
  (setq roryk-org-sync-timer
        (run-with-idle-timer roryk-org-sync-secs t
                             'roryk-org-sync)))

(defun roryk-org-sync-stop ()
  "Stop automated org-mode syncing"
  (interactive)
  (cancel-timer roryk-org-sync-timer))

(roryk-org-sync-start)


;; snagged from https://github.com/kaz-yos
(setq tramp-default-method "ssh")
(setq tramp-password-prompt-regexp
      "^.*\\([pP]assword\\|[pP]assphrase\\|Verification code\\).*:? *")
(setq tramp-ssh-controlmaster-options
      (concat
       "-o ControlPath=~/.ssh/%%r@%%h:%%p"))

;; use ipython
(setq python-shell-interpreter "ipython")
;;
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)
(autoload 'R-mode "ess-site.el" "" t)
;;(add-to-list 'auto-mode-alist '("\\.R\\'" . R-mode))
;;(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . R-mode))
(add-hook 'ess-mode-hook
          (lambda ()
            (ess-toggle-underscore nil)))

(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 80)
(global-whitespace-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; use a single space after a full stop as God intended
(setq sentence-end-double-space nil)
(setq savehist-file (concat spacemacs-cache-directory "savehist")
      enable-recursive-minibuffers t ; Allow commands in minibuffers
      history-length 1000
            savehist-additional-variables '(mark-ring global-mark-ring search-ring regexp-search-ring extended-command-history)
      savehist-autosave-interval 60)
(savehist-mode +1)

(setq ess-fancy-comments nil)

;; use writegood-mode
(global-set-key "\C-cg" 'writegood-mode)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" default)))
 '(org-agenda-files
   (quote
    ("~/Documents/Org/hsph.org" "~/Documents/Org/social.org" "~/Documents/Org/inbox.org")))
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "nil" :slant normal :weight normal :height 130 :width normal)))))
