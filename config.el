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
(setq doom-font (font-spec :family "Iosevka" :size 14 :weight 'light))
;; (setq doom-font (font-spec :family "Noto Serif" :size 24 :weight 'regular))
(setq doom-variable-pitch-font (font-spec :family "Liberation Serif" :size 14))

(setq doom-theme 'mono-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(global-visual-line-mode t)

(global-vi-tilde-fringe-mode nil)
;;(setq display-line-numbers-type nil)

(custom-set-variables
  '(neo-window-position (quote right)))

(use-package mixed-pitch
  :hook
  ;; If you want it in all text modes:
  (text-mode . mixed-pitch-mode))
 
;; (use-package! evil-terminal-cursor-changer
;;  :hook (tty-setup . evil-terminal-cursor-changer-activate))

(require 'web-mode)

;; TYPESCRIPT SETUP!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; TYPESCRIPT SETUP!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; TYPESCRIPT SETUP!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
(defun indent-force ()
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
	)
(add-hook 'web-mode-hook #'indent-force)
(add-hook 'typescript-mode-hook #'indent-force)

(setq tide-tsserver-executable "node_modules/typescript/bin/tsserver")

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
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

)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))



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


(setq evil-multiedit-follow-matches t)
(define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
(define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
(define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
