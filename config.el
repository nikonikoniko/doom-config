;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

(setq org-directory "~/f/notes")
(setq org-roam-directory "~/f/notes/roam")

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
(setq doom-font (font-spec :family "Iosevka" :size 24 :weight 'regular))
;; (setq doom-font (font-spec :family "Noto Serif" :size 24 :weight 'regular))
(setq doom-variable-pitch-font (font-spec :family "Liberation Serif" :size 24))

(setq doom-theme 'mono-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
;;(setq display-line-numbers-type nil)

;; Attempt to open info files in new windows.
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
 
(custom-set-variables
  '(neo-window-position (quote right)))

(use-package mixed-pitch
  :hook
  ;; If you want it in all text modes:
  (text-mode . mixed-pitch-mode))
 
;; (use-package! evil-terminal-cursor-changer
;;  :hook (tty-setup . evil-terminal-cursor-changer-activate))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  ;; (flycheck-mode +1)
  ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (add-hook 'typescript-mode-local-vars-hook
          (lambda ()
            (flycheck-add-next-checker 'typescript-tide 'javascript-eslint 'append)))
(add-hook 'typescript-mode-local-vars-hook
          (lambda ()
            (flycheck-add-next-checker 'tsx-tide 'javascript-eslint 'append)))

;;(add-to-list 'flycheck-disabled-checkers 'typescript-tslint)
;;(setq flycheck-disabled-checkers '(typescript-tslint))

)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

 
(require 'company-org-roam)
(require 'load-theme-buffer-local)
(push 'company-org-roam company-backends)

(require 'web-mode)
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
;; (flycheck-add-mode 'typescript-tslint 'web-mode)


(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(setq debug-on-error t)

;;(add-hook 'post-command-hook 'change-my-background-color)

(add-hook 'after-change-major-mode-hook 'change-my-background-color)

(add-hook 'window-configuration-change-hook 'change-my-background-color)

(setq xxx 0)
(defun change-my-background-color ()
  (cond
    ((eq major-mode 'org-mode)
      (eq xxx 0)
      (setq xxx 1)
      (load-theme 'mono-light t))
    ((eq major-mode 'python-mode)
      (eq xxx 1)
      (setq xxx 0)
      (load-theme 'mono-dark t))))
