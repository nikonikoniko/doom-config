;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")



(use-package! md-roam ; load immediately, before org-roam
  :config
  (setq md-roam-file-extension-single "md")) 
    ;you can omit this if md, which is the default.

(setq org-directory "~/f/notes/roam")
(setq org-roam-directory "~/f/notes/roam")

;; order matters, by roam create which is made by default?
(setq org-roam-file-extensions '("org" "md"))
(setq md-roam-use-markdown-file-links t) ; default is nil

(setq org-roam-capture-templates
      '(("d" "default" plain (function org-roam--capture-get-point)
       "%?"
       :file-name "${slug}"
       :head "#+title: ${title}\n"
       :unnarrowed t)))



;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:

 ;; (setq doom-font (font-spec :family "iosevka fixed ss01" :size 15 :weight 'light))
 (setq doom-font (font-spec :family "iosevka" :size 20 :weight 'light))

;; (setq doom-font (font-spec :family "Iosevka Term" :size 18))
;; (setq doom-font (font-spec :family "Inconsolata Nerd Font" :size 18 :weight 'light))

;; (setq doom-font (font-spec :family "IBM 3270" :size 18))
;; (setq doom-font (font-spec :family "Source Code Pro" :size 16))

 (setq doom-variable-pitch-font (font-spec :family "Source Serif Pro" :size 15 :weight 'light))
 (setq doom-serif-font (font-spec :family "Source Serif Pro" :size 15 :weight 'light))
;; (setq doom-variable-pitch-font (font-spec :family "Liberation Serif" :size 14))

;; (add-hook 'org-mode-hook (lambda () (set-frame-font "Noto Serif Light" t)))

(setq doom-theme 'mono-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

(blink-cursor-mode t)


(setq text-scale-mode-step 1.1)
;; (setq-default line-spacing 0.05)

(custom-set-variables
  '(neo-window-position (quote right))
  )
(setq doom-neotree-enable-variable-pitch nil)
(setq neo-autorefresh nil)

;; (setq prettify-symbols-unprettify-at-point t)
;; (global-prettify-symbols-mode t)

;; (use-package! evil-terminal-cursor-changer
;;  :hook (tty-setup . evil-terminal-cursor-changer-activate))

(require 'web-mode)

(setq typescript-indent-level 2)
(setq js-indent-level 2)
(setq js2-indent-level 2)
(setq javascript-indent-level 2)
(setq js2-basic-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq indent-tabs-mode nil)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq react-indent-level 2)
(setq web-mode-script-padding 2)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(new-line mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
;; ADD THESE TO MAKE SURE THAT ESLINT RUNS BOTH IN TSX-TIDE and TYPESCRIPT-TIDE
(flycheck-add-mode 'javascript-eslint 'web-mode)

;;; THESE FOR ESLINT ONLY
(add-to-list 'flycheck-disabled-checkers 'typescript-tslint)
(flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)
(flycheck-add-next-checker 'tsx-tide 'javascript-eslint 'append)

;; (add-to-list 'flycheck-disabled-checkers 'typescript-tide)
;; (add-to-list 'flycheck-disabled-checkers 'tsx-tide)

;; THESE FOR TSLINT ET ALL
;;(setq flycheck-disabled-checkers 'typescript-tslint 'tsx-tide)
;;(add-to-list 'flycheck-disabled-checkers 'typescript-tslint)
;;(flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)
;;(flycheck-add-next-checker 'tsx-tide 'javascript-eslint 'append)
;;(flycheck-add-mode 'javascript-eslint 'typescript-mode)


;; 
;; 
)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(add-hook 'web-mode-hook #'setup-tide-mode)

;; since emacs 27 this does not woek any more
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;               (setup-tide-mode))))
;; 


;; the following files don't work because buffer-file-name is none
(defun eslint-fix-file ()
  (interactive)
  (message "eslint --fixing the file" (buffer-file-name))
  (shell-command (concat "eslint --fix " (buffer-file-name))))

(defun eslint-fix-file-and-revert ()
  (interactive)
  (eslint-fix-file)
  (revert-buffer t t))

;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook #'eslint-fix-file-and-revert)))
;; 
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (add-hook 'after-save-hook #'eslint-fix-file-and-revert)))
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; (setq debug-on-error t)

;;(add-hook 'post-command-hook 'change-my-background-color)

(require 'company-org-roam)
(push 'company-org-roam company-backends)

(defun lights-on () (interactive) (load-theme 'mono-light t))
(defun lights-off () (interactive) (load-theme 'mono-dark t))

(setq evil-multiedit-follow-matches t)
(define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
(define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
(define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)


;;
;;   code lookup always open in other window
;;
(dolist (fn '(definition references))
  (fset (intern (format "+lookup/%s-other-window" fn))
        (lambda (identifier &optional arg)
          "TODO"
          (interactive (list (doom-thing-at-point-or-region)
                             current-prefix-arg))
          (let ((pt (point)))
            (switch-to-buffer-other-frame (current-buffer))
            ;; (goto-char pt)
            (funcall (intern (format "+lookup/%s" fn)) identifier arg)))))

(map! :leader
      :desc "jump to definition"
      "c d" #'+lookup/definition-other-window)

;;
;;
;;   Org-Roam 
;;

(setq org-roam-buffer-window-parameters '(
					  (no-delete-other-windows . t)
					  )) 
(setq org-roam-buffer-width 0.15)
(setq org-log-done t)


;; (map! :leader
      ;; :desc "roam jump to file"
      ;; "r t"
      ;; (lambda ()
	;; (interactive)
	;; (org-roam) ;; open the org roam buffer
	;; (execute-kbd-macro [?\M-x ?o ?r ?g ?- ?r ?o ?a ?m ?- ?f ?i ?n ?d ?- ?f ?i ?l ?e return ?t ?o ?d ?o return]) ;; hack this stuff because i don;t know how to do it otherwise
	;; ))

(map! :leader
      :desc "TODO LIST"
      "r t"
      (lambda ()
	(interactive)
	(org-agenda nil "z") ;; see z, my custom view below
	))


(map! :leader
      :desc "heute"
      "r h"
      (lambda ()
        (interactive)
	(org-roam-dailies-today)
	;;(org-journal-new-entry)
        ;; (org-journal-open-current-journal-file)
	;; (org-update-all-dblocks)
	))

(map! :leader
      :desc "biffer"
      "r r"
      (lambda ()
        (interactive)
        (org-roam)))

(map! :leader
      :desc "find note"
      "r f"
      (lambda ()
        (interactive)
        (org-roam-find-file)))


;;(set-face-attribute 'org-roam-link nil
;;                       :foreground "cadetblue"
;;                       )

(setq org-link-frame-setup '((file . find-file-other-frame)))

;; set images smaller
(setq org-image-actual-width (/ (display-pixel-width) 5))

(add-hook 'after-init-hook (lambda ()
			     (when (fboundp 'auto-dim-other-buffers-mode)
			       (auto-dim-other-buffers-mode t))))

(setq doom-modeline-buffer-state-icon 0)
(setq doom-modeline-icon nil)

(defface font-lock-function-call-face nil nil)
(setq callRegex '(
                ;; order matters? highrt up takes precedence ?
                ("function \\(\.*\\)\(" 1 'font-lock-function-name-face) ;; function THIS(
                ("def \\(\.*\\)\(" 1 'font-lock-function-name-face) ;; function THIS(
                ("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-call-face) ;; DOTHIS(
                ;;("(?<=function ).*?(?=\()" 1 'font-lock-function-name-face)
                ))
(font-lock-add-keywords 'typescript-mode callRegex)
(font-lock-add-keywords 'python-mode callRegex)

;; '(js2-object-property ((t (:inherit font-lock-variable-name-face))))) 

;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (doom/reload-font)))


(defun set-serif () 
  (interactive)
  (setq buffer-face-mode-face '(:family "Source Serif Pro" :weight regular))
  ;; etq line-spacing 0.3)
  (buffer-face-mode)
  )

(setq global-display-line-numbers-mode nil)

(defun lines-on ()
  (setq display-line-numbers-type t)
  (setq display-line-numbers t)
  (display-line-numbers-mode t))

(defun lines-off ()
  (setq display-line-numbers-type nil)
  (setq display-line-numbers nil)
  (display-line-numbers-mode nil))

(add-hook 'prog-mode-hook (lambda () (lines-on)))
(add-hook 'text-mode-hook (lambda () (lines-off)))
(add-hook 'org-mode-hook (lambda () (lines-off)))

(defun add-padding ()
  (interactive)
  (setq left-margin-width 5)
  (setq right-margin-width 5)
  ; (hide-mode-line-mode t)
  (set-window-buffer nil (current-buffer)))

(defun remove-indent ()
 (interactive)
 (+org-pretty-mode t)
 (setq
        org-adapt-indentation nil ;; do not automatically insert 'tabs' to balance text under headlines
        org-startup-indented nil ;; don't 'fake' any indentation either
        org-indent-mode nil ;; don't 'fake' any indentation either
        org-hide-leading-stars nil ;; hide the starts in front of the headlines
        org-indent-mode-turns-on-hiding-stars nil ;; in indent mode hide the leading stars too
        org-pretty-entities t
        org-indent-indentation-per-level 1
        ;; org-bullets-bullet-list '("➤") ;; no bullets, needs org-bullets package
        ;; org-bullets-bullet-list '("\u200b") ;; no bullets, needs org-bullets package
        ;; org-bullets-bullet-list '("\u200b") ;; zero-width-space character
        org-bullets-bullet-list '(">") ;; no bullets, needs org-bullets package
        org-bullets-bullet-list '("*" "**" "***" "****" "*****" "******") ;; no bullets, needs org-bullets package
        ;; org-bullets-bullet-list '("") ;; no bullets, needs org-bullets package
        org-ellipsis '("...")
       )
  (advice-add 'org-indent-initialize :after #'org-indent-use-stars-for-strings)
  )

;; note... for these to properly and always work, solaire mode from 
;; DOOM needs to be disabled
;; like this (in packages.el): 
;; (package! solaire-mode :disable t)
(add-hook 'org-mode-hook 'set-serif)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-hook 'org-mode-hook 'add-padding)
(add-hook 'org-mode-hook 'remove-indent)
(add-hook 'markdown-mode-hook 'set-serif)


;; notmuch
;; notmuch
;; notmuch
;; notmuch


(require 'org-inlinetask)


  (push '("r" "Respond to email"
          entry (file org-default-notes-file)
          "* TODO Respond to %:from on %:subject  :email: \nSCHEDULED: %t\n%U\n%a\n"
          :clock-in t
          :clock-resume t
          :immediate-finish t)
        org-capture-templates)


(defun vedang/notmuch-reply-later ()
  "Capture this email for replying later."
  (interactive)
  ;; You need `org-capture' to be set up for this to work. Add this
  ;; code somewhere in your init file after `org-cature' is loaded:


  (org-capture nil "r")

  ;; The rest of this function is just a nice message in the modeline.
  (let* ((email-subject (format "%s..."
                                (substring (notmuch-show-get-subject) 0 15)))
         (email-from (format "%s..."
                             (substring (notmuch-show-get-from) 0 15)))
         (email-string (format "%s (From: %s)" email-subject email-from)))
    (message "Noted! Reply Later: %s" email-string)))


(evil-set-initial-state 'notmuch-search-mode 'emacs)
(evil-set-initial-state 'notmuch-tree-mode 'emacs)

(add-to-list 'evil-emacs-state-modes 'notmmuch-search-mode)
(add-to-list 'evil-emacs-state-modes 'notmmuch-tree-mode)


;; org indent

(require 'org-indent)
(setq org-indent-boundary-char ?\s)

(defface org-indent-level- nil nil)
(defface org-indent-level-1 nil nil)
(defface org-indent-level-2 nil nil)
(defface org-indent-level-3 nil nil)
(defface org-indent-level-4 nil nil)
(defface org-indent-level-5 nil nil)
(defface org-indent-level-6 nil nil)

(defface org-fake-schedule nil nil)

 ;; (org-add-props heading-prefix nil 'face 'org-indent))
(defun org-dblock-write:hello (params)
  (defvar stri (org-batch-agenda "a"))
  ;; (defvar stri "aaaaa")
  ;; (defvar sta (org-add-props stri nil 'face 'org-fake-schedule)) ;; doesnt work
   ;; (defvar aa (put-text-property 0 (length stri) 'face 'org-fake-schedule stri))
  (insert stri))
  ;;(insert (substring stri 0 nil)))







;; (setq org-babel-default-header-args '((:exports . "both"))) ;; enabling this causes the jupyter-typescript block below not work...

;; (setq org-babel-default-header-args:typescript '((:session . "ts")))

(setq org-babel-default-header-args:jupyter-typescript '(
							 (:exports . "both")
                                                         (:session . "ts")
                                                         (:kernel . "tslab")))


;; this seems to add syntax-highlighting to jupyter-python and jupyter-typescript blocks
(after! org-src
 (dolist (lang '(python typescript jupyter))
 (cl-pushnew (cons (format "jupyter-%s" lang) lang)
                org-src-lang-modes :key #'car))
  ;; (org-babel-jupyter-override-src-block "python") ;; alias all python to jupyter-python
  ;; (org-babel-jupyter-override-src-block "typescript") ;; alias all python to jupyter-python
 )


(use-package! treemacs-persp
  :when (featurep! :ui workspaces)
  :after (treemacs persp-mode)
  :config
  (treemacs-set-scope-type 'Perspectives))

(after! treemacs
  (defun +treemacs--init ()
    (require 'treemacs)
    (let ((origin-buffer (current-buffer)))
      (cl-letf (((symbol-function 'treemacs-workspace->is-empty?)
                 (symbol-function 'ignore)))
        (treemacs--init))
      (unless (bound-and-true-p persp-mode)
        (dolist (project (treemacs-workspace->projects (treemacs-current-workspace)))
          (treemacs-do-remove-project-from-workspace project)))
      (with-current-buffer origin-buffer
        (let ((project-root (or (doom-project-root) default-directory)))
          (treemacs-do-add-project-to-workspace
           (treemacs--canonical-path project-root)
           (doom-project-name project-root)))
        (setq treemacs--ready-to-follow t)
        (when (or treemacs-follow-after-init treemacs-follow-mode)
          (treemacs--follow))))))

(org-super-agenda-mode t)
(setq org-agenda-start-day "-1d")

(setq org-agenda-files '("~/f/notes/roam"))
;; save org buffers after todo
(add-hook 'focus-out-hook
         (lambda () (org-save-all-org-buffers)))


(add-hook 'org-agenda-mode-hook 'add-padding)

(setq org-agenda-custom-commands
    '(("z" "nikos view"
        ((agenda "" ((org-agenda-span 5)))
        (alltodo "" ((org-agenda-overriding-header "")
                (org-super-agenda-groups
                        '(
                                (:name "      todayyyy"
                                ;; :time-grid t
                                :scheduled today
                                :deadline today)
                        (:name "       overdue"
                                :deadline past
                                :scheduled past)
                        (:name "       deadlines"
                                :deadline future
                                :order 3)
                                (:name "      front Burner"
                                :todo "STRT"
                                :order 2)
                                (:name "      backlog"
                                :todo "HOLD"
                                :order 12)
                                (:name "      scheduled"
                                :scheduled future
                                :order 4
                                )
                                (:name "      Work (unscheduled)"
                                :tag "work"
                                :order 5)
                                (:name "      Email (unscheduled)"
                                :tag "email"
                                :order 6)
                                (:name "      Personal (unscheduled)"
                                :tag "personal"
                                :order 7)
                                (:name "      Learn (unscheduled)"
                                :tag "learn"
                                :order 8)
                                (:name "!!!   to triage! ----- schedule or tag"
                                :todo "TODO"
                                :order 1)
                                (:name "     Waiting"
                                :todo "WAIT"
                                :order 10)
                                ))))))))

;; (set-frame-parameter (selected-frame) 'alpha '(100 100))


;; (add-hook 'focus-out-hook
;;          (lambda ()
;;            (interactive)
;;            (doom/set-frame-opacity 50)))

;; (add-hook 'focus-in-hook
;;          (lambda ()
;;            (interactive)
;;            (doom/set-frame-opacity 100)))

;; (add-to-list 'default-frame-alist '(alpha 50 50))

(setq highlight-indent-guides-method 'character)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(setq publishing-dir "/home/uer/f/code/niko.io/notes")

(defun get-files-to-publish ()
  (cd org-directory)
  (message "pppppppppppppppppppppppppp")
  (message (first (split-string (shell-command-to-string "grep -rlH '#+public: true' .") "\n")))
  (split-string (shell-command-to-string "grep -rlH '#+public: true' .") "\n")
  )

;; cheeeck thiiis outttt
(setq my-blog-extra-head
      (concat
       "<link rel='stylesheet' href='../style.css' />\n"
       "<link rel='stylesheet' href='/../res/main.css' />"))

(setq org-publish-project-alist
      `(("homeeoxs"
       :base-directory ,org-directory
       :publishing-directory ,publishing-dir
       :publishing-function org-html-publish-to-html
       :exclude ".*"
         ;; the following removes extra headers from HTML output -- important!
         :html-link-home "/"
         ;; :html-head nil ;; cleans up anything that would have been in there.
         :html-head-extra ,my-blog-extra-head
         ; :html-head-include-default-style nil
         ; :html-head-include-scripts nil
         ; :html-viewport nil
       :recursive t
       :include ,(get-files-to-publish)
       )))



(setq my-font-lock-keywords '(
                              ("return" . font-lock-constant-face)
                              ("," . font-lock-type-face)
                              ("\\." . font-lock-type-face)
                              ("\\:" . font-lock-type-face)
                              ("<" . font-lock-type-face)
                              (">" . font-lock-type-face)
                              ("|" . font-lock-type-face)
                              (";" . font-lock-type-face)))

(add-hook 'prog-mode-hook (lambda () (font-lock-add-keywords nil my-font-lock-keywords)))

(setq-default prettify-symbols-alist '(("lambda" . ?λ)
                                ("->" . ?→)
                                ("->>" . ?↠)
                                ("=>" . ?⟹) ;; long fat arrow
                                ("/=" . ?≠)
                                ("!==" . ?≠)
                                ("===" . ?≡)
                                ("<=" . ?≤)
                                ("import" . ?_)
                                ("from " . ?_)
                                ("number" . ?Z)
                                ("string" . ?Σ)
                                ("boolean" . ?B)
                                ("return" . ?↳)
                                ("void" . ?∅)
                                (">=" . ?≥)
                                ;;("=<<" . ?=≪)
                                ;;(">>=" . ?≫=)
                                ;;("<=<" . ?↢)
                                ;;(">=>" . ?↣)
                                ("&&" . ?∧)
                                ("||" . ?∨)
                                ;; (" = " . (?  (Br . Bl) ?⇔ (Br . Bl) ? ))
                                ;; ("pipe" . (?⟹  (Br . Bl) ? ))
                                ("not" . ?¬)))

(prettify-symbols-mode t)
(add-hook 'prog-mode-hook (lambda () (prettify-symbols-mode t)))



(add-hook 'prog-mode-hook (lambda () (setq header-line-format "  ")))
(add-hook 'text-mode-hook (lambda () (setq header-line-format "  ")))

