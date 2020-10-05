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

 (setq doom-font (font-spec :family "iosevka fixed ss01" :size 16 :weight 'light))
;; (setq doom-font (font-spec :family "Iosevka Term" :size 18))
;; (setq doom-font (font-spec :family "Inconsolata Nerd Font" :size 18 :weight 'light))
;; (setq doom-font (font-spec :family "IBM 3270" :size 18))
;; (setq doom-font (font-spec :family "Source Code Pro" :size 16))

 (setq doom-variable-pitch-font (font-spec :family "Noto Serif" :size 18 :weight 'light))
;; (setq doom-variable-pitch-font (font-spec :family "Liberation Serif" :size 14))

;; (add-hook 'org-mode-hook (lambda () (set-frame-font "Noto Serif Light" t)))

(add-hook 'org-mode-hook (lambda ()
                            (setq buffer-face-mode-face '(:family "Source Serif Pro" :weight regular))
                            ;; (setq buffer-face-mode-face '(:family "DejaVu Serif Condensed"))
                            (buffer-face-mode t)
			    ))

(setq doom-theme 'mono-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)
(global-visual-line-mode nil)

(blink-cursor-mode t)
(setq text-scale-mode-step 1.1)
(setq-default line-spacing 0.05)

(global-vi-tilde-fringe-mode nil)
;;(setq display-line-numbers-type nil)

(custom-set-variables
  '(neo-window-position (quote right))
  '(neo-window-fixed-size nil)
  '(neo-smart-open t)
  )



;; (setq prettify-symbols-unprettify-at-point t)
;; (global-prettify-symbols-mode t)

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
(add-hook 'js2-mode-hook #'indent-force)
(add-hook 'rjsx-mode-hook #'indent-force)

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

	;; (setq my-font-lock-keywords '(("return" . font-lock-constant-face)))
	(font-lock-add-keywords nil my-font-lock-keywords)
;;   (setq prettify-symbols-alist '(("lambda" . ?λ)
;;                                  ("->" . ?→)
;;                                  ("->>" . ?↠)
;;                                  ("=>" . ?⟹) ;; long fat arrow
;;                                  ;;("=>" . ?→) ;; smaller math arrow
;;                                  ;;("map" . ?⟾) ;; fat ended arrow
;;                                  ;;(".map" . ?⟾) 
;;                                  ;; ("map" . ?↦) ;; thin ended arrow
;;                                  ("/=" . ?≠)
;;                                  ("!==" . ?≠)
;;                                  ("===" . ?≡)
;;                                  ("<=" . ?≤)
;; 				 ;; ("if" . ??)
;; 				 ;; ("const" . ?●) dot
;; 				 ;; ("import" . ?●)
;; 				 ;; ("from" . ?●)
;; 				 ;; ("const " . ?●)
;; 				 ("import" . ?_)
;; 				 ("from " . ?_)
;; 				 ;; ("const" . ?○)
;; 				 ;;  ("import" . ?○)
;; 				 ;; ("from" . ?○)
;; 				 ("number" . ?Z)
;; 				 ("string" . ?Σ)
;; 				 ("boolean" . ?B)
;; 				 ;; ("function" . ?Ƒ)
;; 				 ;; ("import" . ?⭆) ;; tripple arrow import
;; 				 ;; ("export" . ?←)
;; 				 ;; ("return" . ?⮩)
;; 				 ("return" . ?↳)
;; 				 ;; ("Promise" . ?∞)
;; 				 ;; ("async" . ?∞)
;; 				 ;; ("await" . ?∞)
;; 				 ("curry" . ?∂)
;; 				 ("void" . ?∅)
;; 				 ("partial" . ?∂)
;; 				 ("Partial" . ?∂)
;;                                  (">=" . ?≥)
;;                                  ;;("=<<" . ?=≪)
;;                                  ;;(">>=" . ?≫=)
;;                                  ;;("<=<" . ?↢)
;;                                  ;;(">=>" . ?↣)
;;                                  ("&&" . ?∧)
;; 				 ("true" . ?⊤)
;; 				 ("false" . ?⊥)
;;                                  ("||" . ?∨)
;; 				 ;; (" = " . (?  (Br . Bl) ?⇔ (Br . Bl) ? ))
;; 				 ;; ("pipe" . (?⟹  (Br . Bl) ? ))
;;                                  ("not" . ?¬)))
;; 
;;   (prettify-symbols-mode t)
;; 
;; 
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

;; (add-hook 'after-change-major-mode-hook 'change-my-background-color)
;; (add-hook 'window-configuration-change-hook 'change-my-background-color)

;; (setq xxx 0)
;; (defun change-my-background-color ()
;;   (cond
;;     ((eq major-mode 'org-mode)
;;       (eq xxx 0)
;;       (setq xxx 1)
;;       (load-theme 'mono-light t))
;;     ((eq major-mode 'python-mode)
;;       (eq xxx 1)
;;       (setq xxx 0)
;;       (load-theme 'mono-dark t))))
;; 
(defun lights-on () (interactive) (load-theme 'mono-light t))
(defun lights-off () (interactive) (load-theme 'mono-dark t))


(setq evil-multiedit-follow-matches t)
(define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
(define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
(define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)


(dolist (fn '(definition references))
  (fset (intern (format "+lookup/%s-other-window" fn))
        (lambda (identifier &optional arg)
          "TODO"
          (interactive (list (doom-thing-at-point-or-region)
                             current-prefix-arg))
          (let ((pt (point)))
            (switch-to-buffer-other-window (current-buffer))
            ;; (goto-char pt)
            (funcall (intern (format "+lookup/%s" fn)) identifier arg)))))

(map! :leader
      :desc "jump to definition"
      "c d" #'+lookup/definition-other-window)

;;
;;
;;   Org-Roam 
;;


(setq org-roam-buffer-window-parameters '((no-delete-other-windows . t))) 

(map! :leader
      :desc "roam jump to todo todo"
      "r t"
      (lambda ()
	(interactive)
	;; (org-roam) ;; open the org roam buffer
	(execute-kbd-macro [?\M-x ?o ?r ?g ?- ?r ?o ?a ?m ?- ?f ?i ?n ?d ?- ?f ?i ?l ?e return ?t ?o ?d ?o return]) ;; hack this stuff because i don;t know how to do it otherwise
	))

(map! :leader
      :desc "heute"
      "r h"
      (lambda ()
	(interactive)
	(org-roam-dailies-today)))


(map! :leader
      :desc "gestern"
      "r g"
      (lambda ()
	(interactive)
	(org-roam-dailies-yesterday 1)))

(map! :leader
      :desc "morgen"
      "r m"
      (lambda ()
	(interactive)
	(org-roam-dailies-tomorrow 1)))


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

(setq org-link-frame-setup '((file . find-file-other-window)) )
(setq org-image-actual-width (/ (display-pixel-width) 3))

;; (setq auto-dim-other-buffers-face '(:background "#ddd"))


(add-hook 'after-init-hook (lambda ()
  (when (fboundp 'auto-dim-other-buffers-mode)
    (auto-dim-other-buffers-mode t))))
