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
     javascript
     csv
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
     auto-completion
     osx
     shell
     org
     syntax-checking
     ess
     python
     markdown
     clojure
     go
     lua
     polymode
     yaml
     html
     c-c++
     odyssey
     )
   dotspacemacs-additional-packages '(ob-ipython)

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
   dotspacemacs-smart-closing-parenthesis nil
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
   dotspacemacs-default-font '("DejaVu Sans Mono"
                               :size 11
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
                                          :size 12
                                          :weight normal
                                          :width normal
                                          :powerline-scale 1.1))
;; (setq-default evil-escape-key-sequence "jj")
 ;;(setq-default evil-escape-delay 0.2)
)

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  (global-evil-search-highlight-persist 0)
  (evil-search-highlight-persist 0)
  ;; unprettify symbols under the cursor as we are editing
  (setq prettify-symbols-unprettify-at-point 'right-edge)

  ;; turn off super annoying ess fancy comments
  ;; turn off the super annoying ess underscore replacement
  (add-hook 'ess-mode-hook
            (lambda ()
              (setq ess-toggle-underscore nil)
              (setq ess-fancy-comments nil)))

  (defvar keep-alive-timer nil)
  (defun roryk-keep-alive ()
    "documentation helps?"
    (progn
      (set-buffer "*shell*")
      (comint-send-string "*shell*" ".")))
  (defun toggle-keep-alive ()
    (if keep-alive-timer
        (setq keep-alive-timer nil)
      (setq keep-alive-timer (run-at-time 0 (* 30 60) roryk-keep-alive))))
  )

(with-eval-after-load 'org
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

  (setq org-stuck-projects '("+@project/-MAYBE-DONE" ("NEXT" "WAITING")))
  (setq org-tags-exclude-from-inheritance '("@project"))
  (setq org-agenda-files '("~/Documents/Org/hsph.org"))

  (setq org-agenda-files
        (append org-agenda-files
                (file-expand-wildcards
                 "~/cache/hsph/*/org/*.org")))

  (setq org-icalendar-combined-agenda-file "~/Dropbox/Public/hsph.ics")
  (setq org-icalendar-alarm-time 60)
  (setq org-agenda-default-appointment-duration 60)
  (setq org-agenda-skip-scheduled-if-done nil)

  (setq org-refile-targets
        '(("~/Documents/Org/hsph.org" :maxlevel . 1)))

  ;; don't clutter headings with clock entries
  (setq org-log-into-drawer "LOGBOOK")
  (setq org-clock-into-drawer 1)

  ;; move the habit graph to the right more
  (setq org-habit-graph-column 60)

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

  ;; Set to the location of your Org files on your local system
  (setq org-directory "~/Documents/Org")
  ;; Set to the name of the file where new notes will be stored
  (setq org-mobile-inbox-for-pull "~/Documents/Org/inbox.org")
  ;; Set to <your Dropbox root directory>/MobileOrg.
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

  (org-babel-do-load-languages
    'org-babel-load-languages
    '((ipython . t)))
  (setq org-confirm-babel-evaluate nil)
  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

  (global-set-key (kbd "s-{") 'spacemacs/layouts-transient-state/persp-prev)
  (global-set-key (kbd "s-}") 'spacemacs/layouts-transient-state/persp-next)


  ;; (require 'org-mu4e)

  ;; (setq mu4e-view-show-images t)
  ;; (setq mu4e-maildir (expand-file-name "~/Maildir"))
  ;; (setq mu4e-drafts-folder "/[Gmail].Drafts")
  ;; (setq mu4e-sent-folder   "/[Gmail].Sent Mail")
  ;; (setq mu4e-trash-folder  "/[Gmail].Trash")

  ;; ;; don't save message to Sent Messages, GMail/IMAP will take care of this
  ;; (setq mu4e-sent-messages-behavior 'delete)

  ;; ;; setup some handy shortcuts
  ;; (setq mu4e-maildir-shortcuts
  ;;       '(("/INBOX"             . ?i)
  ;;         ("/[Gmail].Sent Mail" . ?s)
  ;;         ("/[Gmail].All Mail" . ?a)
  ;;         ("/[Gmail].Trash"     . ?t)))

  ;; ;; allow for updating mail using 'U' in the main view:
  ;; (setq mu4e-get-mail-command "offlineimap"
  ;;       mu4e-headers-auto-update t
  ;;       mu4e-mu-binary "/usr/local/bin/mu"
  ;;       mu4e-update-interval 300)

  ;; (require 'mu4e-contrib)
  ;; (setq mu4e-html2text-command 'mu4e-shr2text)

  ;; ;; something about ourselves
  ;; ;; I don't use a signature...
  ;; (setq
  ;;  user-mail-address "rory.kirchner@gmail.com"
  ;;  user-full-name  "Rory Kirchner")

  ;; ;; sending mail -- replace USERNAME with your gmail username
  ;; ;; also, make sure the gnutls command line utils are installed
  ;; ;; package 'gnutls-bin' in Debian/Ubuntu, 'gnutls' in Archlinux.

  ;; (setq message-send-mail-function 'smtpmail-send-it
  ;;       starttls-use-gnutls t
  ;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
  ;;       smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
  ;;       smtpmail-default-smtp-server "smtp.gmail.com"
  ;;       smtpmail-smtp-server "smtp.gmail.com"
  ;;       smtpmail-smtp-service 587
  ;;       starttls-gnutls-program "/usr/local/bin/gnutls-cli"
  ;;       smtpmail-stream-type 'starttls
  ;;       smtpmail-smtp-user "rory.kirchner"
  ;;       smtpmail-smtp-server "smtp.gmail.com"
  ;;       smtpmail-debug-info t)

  ;; (setq message-kill-buffer-on-exit t)
  ;; )
  )

;; cwl is YAML
(add-to-list 'auto-mode-alist'("\\.cwl" . yaml-mode))

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
;;(add-to-list 'auto-mode-alist '("\\.R\\'" . R-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd\\'" . poly-markdown+r-mode))
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

(setq R-indent-level 4)

(defun insert-r-chunk (header)
  "Insert an r-chunk in markdown mode. Necessary due to interactions between polymode and yas snippet"
  (interactive "sHeader: ")
  (insert (concat "```{r " header "}\n\n```"))
  (forward-line -1))

;; remove smartparens mode, it is breaking everything.
(remove-hook 'prog-mode-hook #'smartparens-mode)
;; (spacemacs/toggle-smartparens-globally-off)

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
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern tern coffee-mode request-deferred deferred org-trello helm-company helm-c-yasnippet fuzzy company-web web-completion-data company-statistics company-go company-c-headers company-anaconda company clojure-snippets auto-yasnippet ac-ispell auto-complete yasnippet winum org-plus-contrib csv-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help pcache go-guru pug-mode hide-comnt wgrep smex ivy-hydra counsel-projectile counsel swiper ivy web-mode tagedit slim-mode scss-mode sass-mode less-css-mode jade-mode helm-css-scss haml-mode emmet-mode yapfify uuidgen powerline py-isort osx-dictionary org-projectile org-download dash-functional mu4e-maildirs-extension mu4e-alert ht alert log4e gntp markdown-mode live-py-mode link-hint parent-mode projectile request go-mode gitignore-mode git-link pos-tip flycheck flx eyebrowse evil-visual-mark-mode evil-unimpaired magit magit-popup git-commit with-editor smartparens iedit evil-ediff anzu evil goto-chg undo-tree ctable ess julia-mode dumb-jump diminish column-enforce-mode hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider spinner queue pkg-info clojure-mode epl bind-map bind-key pythonic f dash s helm avy helm-core popup async package-build zenburn-theme yaml-mode ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package toc-org spacemacs-theme spaceline smooth-scrolling smeargle reveal-in-osx-finder restart-emacs rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-yapf popwin polymode pip-requirements persp-mode pcre2el pbcopy paradox page-break-lines osx-trash orgit org-repo-todo org-present org-pomodoro org-bullets open-junk-file ob-ipython neotree move-text monokai-theme mmm-mode markdown-toc magit-gitflow lua-mode lorem-ipsum linum-relative leuven-theme launchctl info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-ag google-translate golden-ratio go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu ess-smart-equals ess-R-object-popup ess-R-data-view disaster define-word cython-mode cmake-mode clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu buffer-move bracketed-paste auto-highlight-symbol anaconda-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(ring-bell-function (quote ignore))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "nil" :slant normal :weight normal :height 130 :width normal)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-safe-themes
   (quote
    ("a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e80932ca56b0f109f8545576531d3fc79487ca35a9a9693b62bf30d6d08c9aaf" default)))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (symon string-inflection solarized-theme sayid realgud test-simple loc-changes load-relative password-generator org-category-capture org-brain impatient-mode helm-purpose window-purpose imenu-list godoctor go-rename evil-org evil-lion editorconfig company-lua cmake-ide levenshtein web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern tern coffee-mode request-deferred deferred org-trello helm-company helm-c-yasnippet fuzzy company-web web-completion-data company-statistics company-go company-c-headers company-anaconda company clojure-snippets auto-yasnippet ac-ispell auto-complete yasnippet winum org-plus-contrib csv-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help pcache go-guru pug-mode hide-comnt wgrep smex ivy-hydra counsel-projectile counsel swiper ivy web-mode tagedit slim-mode scss-mode sass-mode less-css-mode jade-mode helm-css-scss haml-mode emmet-mode yapfify uuidgen powerline py-isort osx-dictionary org-projectile org-download dash-functional mu4e-maildirs-extension mu4e-alert ht alert log4e gntp markdown-mode live-py-mode link-hint parent-mode projectile request go-mode gitignore-mode git-link pos-tip flycheck flx eyebrowse evil-visual-mark-mode evil-unimpaired magit magit-popup git-commit with-editor smartparens iedit evil-ediff anzu evil goto-chg undo-tree ctable ess julia-mode dumb-jump diminish column-enforce-mode hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider spinner queue pkg-info clojure-mode epl bind-map bind-key pythonic f dash s helm avy helm-core popup async package-build zenburn-theme yaml-mode ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package toc-org spacemacs-theme spaceline smooth-scrolling smeargle reveal-in-osx-finder restart-emacs rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-yapf popwin polymode pip-requirements persp-mode pcre2el pbcopy paradox page-break-lines osx-trash orgit org-repo-todo org-present org-pomodoro org-bullets open-junk-file ob-ipython neotree move-text monokai-theme mmm-mode markdown-toc magit-gitflow lua-mode lorem-ipsum linum-relative leuven-theme launchctl info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-ag google-translate golden-ratio go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu ess-smart-equals ess-R-object-popup ess-R-data-view disaster define-word cython-mode cmake-mode clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu buffer-move bracketed-paste auto-highlight-symbol anaconda-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(ring-bell-function (quote ignore))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "nil" :slant normal :weight normal :height 130 :width normal)))))
)
