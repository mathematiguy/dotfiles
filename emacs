(require 'server)
(unless (server-running-p)
  (server-start))

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)
(setq ns-pop-up-frames nil)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(if window-system (set-exec-path-from-shell-PATH))

  (if (not (getenv "TERM_PROGRAM"))
      (let ((path (shell-command-to-string
		   "$SHELL -cl \"printf %s \\\"\\\$PATH\\\"\"")))
	(setenv "PATH" path)
	(setq exec-path (split-string path ":"))))

; use el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")


; turn on line and column numbering
(global-linum-mode 1)
(column-number-mode 1)

; stop creating those obnoxious temporary and backup files
;(setq make-backup-files nil)
;(setq auto-save-default nil)

(let ((default-directory "~/.config/emacs.d/"))
      (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/rory/" "~/.config/elpa")
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/rory")

; options for using nrepl
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")


(setq py-install-directory "~/.emacs.d/python-mode.el-6.0.12/")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)
; use IPython
(setq py-shell-name "ipython")
(setq-default py-shell-name "/usr/local/share/python/ipython")
(setq-default py-which-bufname "IPython")
(setq py-python-command-args (cons "--gui=osx" (cons "--pylab=osx" py-python-command-args)))
(setq py-force-py-shell-name-p t)

; use autocomplete
;(setq py-load-pymacs-p t)
(require 'auto-complete-config)
(ac-config-default)
(autoload 'company-mode "company" nil t)
; use ropemacs
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
;(setq jedi:key-goto-definition (kbd "C-c d"))
;(setq jedi:key-show-doc (kbd "C-c D"))

; switch to the interpreter after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)
; don't split windows
(setq py-split-windows-on-execute-p nil)
; try to automagically figure out indentation
;(setq py-smart-indentation t)

; make Emacs.app behave like other OSX applications
;(require 'redo+)
;(require 'mac-key-mode)
;(mac-key-mode 1)

(require 'pymacs)
(setq pymacs-python-command py-python-command)
(setq py-load-pymacs-p t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")

(require 'surround)
(global-surround-mode 1)

(require 'clojure-mode)
;(setq lisp-indent-offset 2)
(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)
(require 'clojure-jump-to-file)


(require 'evil)
(require 'goto-chg)
(evil-mode 1)
(setq evil-default-cursor t)
(set-cursor-color "white")

;(load-theme 'solarized-dark t)
(set-default-font "Source Code Pro-14")

;; add marmalade to the package repo
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("marmalade" .
				 "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
;; End use marmalade

;; set up tramp to work properly
(setq tramp-default-method "ssh")

;; turn on fill column indicator
;(add-hook 'after-change-major-mode-hook 'fci-mode)
(setq-default fill-column 80)

;; configure emacs speaks statistics (ESS)
(require 'ess-site)
;(load "~/.config/emacs.d/rory/ess-svn/lisp/ess-site.el")
; this behavior is very very annoying, shut it off
(ess-toggle-underscore nil)
;; end conkigure ESS

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; use org mode
(require 'org-install)
;use org-bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
; custom org-agenda
(require 'org-agenda)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)


; set org-mode timer to nice defaults for pomodoro
;(add-to-list 'org-modules 'org-timer)
;(setq org-timer-default-timer 25)
;(add-hook 'org-clock-in-hook '(lambda ()
;      (if (not org-timer-current-timer)
;      (org-timer-set-timer '(16)))))
(require 'org-pomodoro)
(setq org-pomodoro-play-sounds nil)


; turn off the annoying ask-to-evaluate in org-babel
(setq org-confirm-babel-evaluate nil)

(setq org-agenda-files (list "~/Documents/Org/"))
;(setq org-agenda-skip-deadline-if-done t)
;(setq org-agenda-skip-scheduled-if-done t)
; use evil mode to move around
(define-key org-agenda-mode-map "j" 'evil-next-line)
(define-key org-agenda-mode-map "k" 'evil-previous-line)

(defun esf/evil-key-bindings-for-org ()
  ;;(message "Defining evil key bindings for org")
  (evil-declare-key 'normal org-mode-map
    "gk" 'outline-up-heading
    "gj" 'outline-next-visible-heading
    "H" 'org-beginning-of-line ; smarter behaviour on headlines etc.
    "L" 'org-end-of-line ; smarter behaviour on headlines etc.
    "t" 'org-todo ; mark a TODO item as DONE
    ",c" 'org-cycle
    (kbd "TAB") 'org-cycle
    ",e" 'org-export-dispatch
    ",n" 'outline-next-visible-heading
    ",p" 'outline-previous-visible-heading
    ",t" 'org-set-tags-command
    ",u" 'outline-up-heading
    "$" 'org-end-of-line ; smarter behaviour on headlines etc.
    "^" 'org-beginning-of-line ; ditto
    "-" 'org-ctrl-c-minus ; change bullet style
    "<" 'org-metaleft ; out-dent
    ">" 'org-metaright ; indent
    ))
(esf/evil-key-bindings-for-org)

(defun hard-mode ()
  (define-key evil-normal-state-map "h" nil)
  (define-key evil-normal-state-map "j" nil)
  (define-key evil-normal-state-map "k" nil)
  (define-key evil-normal-state-map "l" nil)
  (define-key evil-normal-state-map "C-f" nil)
  (define-key evil-normal-state-map "C-b" nil))

(setq org-directory "~/Documents/Org/")

(setq org-startup-idented t)
(setq org-todo-keywords
      '((type "TODO(t)" "WAITING(w)" "APPT(a)" "NEXT(n)" "READ(r)"
	      "|"
	      "DEFERRED(e)" "DONE(d)" "SOMEDAY(s)" "MAYBE(m)" "IDEA(i)")
	(sequence "PROJECT(p)" "|" "FINISHED(f)" "CANCELLED(c)")))

; stuff for GTD
(setq org-agenda-custom-commands
      '(("W" "Weekly Review"
         ((agenda "" ((org-agenda-ndays 14)))
          (stuck "")
	  (tags "INBOX" ((org-agenda-files '("~/Documents/Org/notes.org"))))
          (tags "PROJECT") ;; review all projects
          (tags "SOMEDAY") ;; review someday/maybe items
	  (todo "NEXT")))  ;; review what is next

	("D" "Daily review"
	 ((agenda "" ((org-agenda-ndays 14)))
	  (stuck "")
	  (tags "INBOX" ((org-agenda-files '("~/Documents/Org/notes.org"))))
	  (todo "NEXT")
	  (todo "READ"))))
)

; good set of refile targets
(setq org-refile-targets (quote ((nil :maxlevel . 3)
				 (org-agenda-files :maxlevel . 3))))

;;;; Refile settings
; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))
;Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
(setq org-refile-target-verify-function 'bh/verify-refile-target)

(setq org-default-notes-file (concat org-directory "notes.org"))
(define-key global-map "\C-cc" 'org-capture)

;; org-capture templates, i dont like this
(setq org-capture-templates
      (quote (("t" "todo" entry (file org-default-notes-file)
               "* TODO %\n%U\n%a\n  %i")
              ("n" "note" entry (file org-default-notes-file)
               "* %?\n%U\n%a\n  %i")
              ("p" "Phone call" entry (file org-default-notes-file)
               "* PHONE %? :PHONE:\n%U"))))

(setq org-tags-exclude-from-inheritance '("PROJECT" "SOMEDAY"))
(setq org-stuck-projects '("+PROJECT/-DONE-SOMEDAY-MAYBE" ("NEXT") ()))

(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file)
  (org-map-entries 'org-archive-subtree "/FINISHED" 'file)
  (org-map-entries 'org-archive-subtree "/CANCELLED" 'file))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(defun ess-prompt-wait2 (proc &optional  start-of-output sleep)
  "Wait for a prompt to appear at BOL of process burffer
PROC is the ESS process. Does not change point"
;; redefined ess-prompt-wait from the ess-inf.el
  (if sleep (sleep-for sleep)); we sleep here, *and* wait below
  (if start-of-output nil (setq start-of-output (point-min)))
  (with-current-buffer (process-buffer proc)
    (while (progn
             (accept-process-output proc 0 500)
             (redisplay t)
             (goto-char (marker-position (process-mark proc)))
             (beginning-of-line)
             (if (< (point) start-of-output) (goto-char start-of-output))
             (not (looking-at inferior-ess-primary-prompt))))))


; set up babel to use R
(org-babel-do-load-languages
       'org-babel-load-languages
             '((R . t)
	       (python . t)
	       (clojure . t)
	       (sh . t)))

(require 'recentf)
;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; enable recent files mode.

; 50 files ought to be enough.
;(recentf-mode t)
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
    "Use `ido-completing-read' to \\[find-file] a recent file"
      (interactive)
        (if (find-file (ido-completing-read "Find recent file: " recentf-list))
	          (message "Opening file...")
	      (message "Aborting")))

(require 'git)

; dired tweaks
(setq dired-auto-revert-buffer "t")

; make moving around in emacs more like using iterm
(defun select-next-window ()
    "Switch to the next window"
      (interactive)
        (select-window (next-window)))

(defun select-previous-window ()
    "Switch to the previous window"
      (interactive)
        (select-window (previous-window)))

; buffer and movement tweaks
(global-set-key (kbd "s-}") 'select-next-window)
(global-set-key (kbd "s-{") 'select-previous-window)
(global-set-key (kbd "s-[") 'switch-to-prev-buffer)
(global-set-key (kbd "s-]") 'switch-to-next-buffer)
; buffer and movement tweaks

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
	(delq (current-buffer)
	      (remove-if-not 'buffer-file-name (buffer-list)))))

(setq temporary-file-directory "~/.emacs.d/tmp/")
;; ;(setq flymake-log-level 3)
;; (eval-after-load "flymake"
;;   '(progn
;;     (defun flymake-after-change-function (start stop len)
;;       "Start syntax check for current buffer if it isn't already running."
;;       ;; Do nothing, don't want to run checks until I save.
;;       )))

;; (when (load "flymake" t)
;;     (defun flymake-pylint-init ()
;;       (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 			 'flymake-create-temp-inplace))
;; 	 (local-file (file-relative-name
;; 		      temp-file
;; 		      (file-name-directory buffer-file-name))))
;; 	(list "pychecker.sh" (list temp-file))))

;;     (add-to-list 'flymake-allowed-file-name-masks
;; 	     '("\\.py\\'" flymake-pylint-init)))

;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;; '(flymake-errline ((((class color)) (:background "LightPink" :foreground "black"))))
;; '(flymake-warnline ((((class color)) (:background "LightBlue2" :foreground "black"))))

; zen-check
(require 'flymake)

(custom-set-variables
 '(flymake-allowed-file-name-masks
   (quote (("\\.c\\'" flymake-simple-make-init)
           ("\\.cpp\\'" flymake-simple-make-init)
           ("\\.xml\\'" flymake-xml-init)
           ("\\.html?\\'" flymake-xml-init)
           ("\\.cs\\'" flymake-simple-make-init)
           ("\\.p[ml]\\'" flymake-perl-init)
           ("\\.php[345]?\\'" flymake-php-init)
           ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup)
           ("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup)
           ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup)
           ("\\.tex\\'" flymake-simple-tex-init)
           ("\\.idl\\'" flymake-simple-make-init)
           ("\\.py\\'" flymake-zencheck-init)))))

(defun flymake-zencheck-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "zencheck" (list local-file))))

(add-hook 'find-file-hook 'flymake-find-file-hook)

(defun flymake-init-vars-hook ()
  (setq flymake-err-line-patterns
        (cons
         (quote ("^\\(.*?\\):\\([0-9]+\\):\\([0-9]+\\):\\(.*\\)" 1 2 3 4))
         flymake-err-line-patterns)))

(add-hook 'find-file-hook 'flymake-init-vars-hook)
(require 'flymake-cursor)

;(load "~/.emacs.d/nxhtml/autostart")
(require 'ein)
;(setq ein:use-auto-complete t)
;(setq ein:use-smartrep t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

; turn off the bell
(setq ring-bell-function 'ignore)


(require 'comint)
(define-key comint-mode-map [(meta p)]
  'comint-previous-matching-input-from-input)
(define-key comint-mode-map [(meta n)]
  'comint-next-matching-input-from-input)
(define-key comint-mode-map [(control meta n)]
  'comint-next-input)
(define-key comint-mode-map [(control meta p)]
  'comint-previous-input)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(ansi-color-names-vector ["#262626" "#d70000" "#5f8700" "#af8700" "#0087ff" "#af005f" "#00afaf" "#626262"])
; '(background-color nil)
; '(background-mode dark)
 '(blink-cursor-mode t)
 '(column-number-mode t)
; '(cursor-color nil)
 '(custom-safe-themes (quote ("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "843a82ff3b91bec5430f9acdd11de03fc0f7874b15c1b6fbb965116b4c7bf830" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(display-battery-mode t)
 '(ess-swv-processor (quote knitr))
; '(foreground-color nil)
 '(menu-bar-mode nil)
 '(py-shell-name "ipython")
 '(scroll-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-level-1 ((t (:foreground "dodger blue" :weight bold :height 1.0))))
 '(org-level-2 ((t (:foreground "#edd400" :weight bold :height 1.0)))))


;; Toggle between split windows and a single window
(defun toggle-windows-split()
  "Switch back and forth between one window and whatever split of windows we
might have in the frame. The idea is to maximize the current buffer, while being
able to go back to the previous split of windows in the frame simply by calling
this command again."

  (interactive)
  (if (not (window-minibuffer-p (selected-window)))
      (progn
        (if (< 1 (count-windows))
            (progn
              (window-configuration-to-register ?u)
              (delete-other-windows))
          (jump-to-register ?u))))
  (my-iswitchb-close))

(define-key global-map (kbd "C-|") 'toggle-windows-split)
(setq inferior-lisp-program "lein repl")

; restore buffers on open
;(desktop-save-mode 1)
;(ns-toggle-fullscreen)

;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Fix ido-ubiquitous for newer packages
(defmacro ido-ubiquitous-use-new-completing-read (cmd package)
  `(eval-after-load ,package
     '(defadvice ,cmd (around ido-ubiquitous-new activate)
        (let ((ido-ubiquitous-enable-compatibility nil))
          ad-do-it))))

(ido-ubiquitous-use-new-completing-read webjump 'webjump)
(ido-ubiquitous-use-new-completing-read yas/expand 'yasnippet)
(ido-ubiquitous-use-new-completing-read yas/visit-snippet-file 'yasnippet)

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
;(global-git-gutter-mode t)
;(require 'rainbow-delimiters)
;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(require 'nose)

(defun visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))

(global-set-key (kbd "C-c C-t") 'visit-term-buffer)

;(electric-pair-mode +1)
;(electric-indent-mode +1)
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))
; set the full filename in the title, like prelude does
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;(package-initialize)
;(elpy-enable)
;(elpy-use-ipython)
;(elpy-clean-modeline)
;; begin todochiku, enable the growlnotify
;(load-file "~/.emacs.d/plugins/todochiku.el")
;(require 'todochiku)
;(setq todochiku-icons-directory "~/emacs.d/rory/todochiku-icons")

;; begin: orgmode + appt
; For org appointment reminders
;; Get appointments for today
(defun my-org-agenda-to-appt ()
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))

;; Run once, activate and schedule refresh
(my-org-agenda-to-appt)
(appt-activate t)
(run-at-time "24:01" nil 'my-org-agenda-to-appt)

; Update appt each time agenda opened.
(add-hook 'org-finalize-agenda-hook 'my-org-agenda-to-appt)
;; end:   orgmode + appt

;;  change color of lines which exceed 80 characters
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

;; we are using OSX quite a bit so do this for the alert
(require 'alert)
(setq alert-default-style 'growl)

;; Diminish modeline clutter
;;(require 'diminish)
;;(diminish 'wrap-region-mode)
;;(diminish 'yas/minor-mode)
