(deftheme mono-light
  "Created 2020-03-09.")

;; possible nice background color #fbf8ef

(let ((bgchroma1 "#fff8ff")
      ;; why is fff not white ?
      (bgchroma2 "#fbf8ef")
      (bgchroma3 "#f5f3eb")
      (bgchroma4 "#ddd8cd")
      (bgchroma5 "#ccc8bc")
      (bgchroma6 "#bbb8ab")

      (fgchroma1 "#000")
      (fgchroma2 "#111")
      (fgchroma3 "#333")
      (fgchroma4 "#444")
      (fgchroma5 "#555")
      (fgchroma6 "#666")

      (inactiveback "whitesmoke")

      (err "orangered")
      (war "yellow")
      (inf "beige")
      ;; (comment "#dba")
      (comment "#bbbbbb")
      ;; (comment "#9bf")
      ;; (comment "#ac7")
      ;; (comment "lightsteelblue")

      (hlchroma1 "teal")
      (hlchroma2 "palevioletred")
      (hlchroma3 "lightslategrey")
      (obchroma1 "orange")
      (obchroma2 "palevioletred")
      (obchroma3 "palevioletred")
      (serif "Source Serif Pro")
      (sans "Sans")
      (mono "iosevka"))


(custom-theme-set-faces
 'mono-light
 `(default ((t (
		:foreground ,fgchroma3
		:background ,bgchroma2
		:stipple nil 
		:inherit nil))))
 `(cursor ((t (:background "turquoise"))))
 `(line-number ((t (:foreground ,bgchroma4 :height .8 :background ,bgchroma3))))
 `(line-number-current-line ((t (:foreground ,bgchroma6 :height .8 :background ,bgchroma4))))
 `(vertical-border ((t (:foreground ,bgchroma2 :background ,bgchroma2))))

 ;; tiny little line between windows
 `(window-divider ((t (:foreground ,bgchroma3 :background ,bgchroma3))))
 ;; `(fringe ((t (:background ,bgchroma3))))
 `(fringe ((t (:foreground ,fgchroma1 :background ,bgchroma3))))

 `(fixed-pitch ((t (:family "Monospace"))))
 `(variable-pitch ((t (:family "Source Sans Pro"))))
 ;; `(neo-dir-link-face ((t (:family "Iosevka"))))
 ;; `(neo-file-link-face ((t (:family "Monospace"))))
 ;; `(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 `(escape-glyph ((t (:weight bold :foreground ,fgchroma6))))
 `(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 `(minibuffer-prompt ((t (:foreground ,fgchroma5))))

 ;; highlight is the line that you are on
 `(highlight ((t (:background nil))))

 ;; region is selected
 `(region ((t (:background ,bgchroma4))))
 `(shadow ((t ())))
 `(secondary-selection ((t (:background ,bgchroma3))))
 `(trailing-whitespace ((t (:background ,err))))
 `(font-lock-builtin-face ((t (:foreground ,hlchroma3))))
 `(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 `(font-lock-comment-face ((t (:foreground ,comment :slant italic))))
 `(font-lock-constant-face ((t (:foreground ,hlchroma2))))
 `(font-lock-doc-face ((t (:foreground ,fgchroma3))))

 `(highlight-quoted-symbol ((t (:inherit nil :foreground ,hlchroma3))))


 `(web-mode-html-tag-face ((t (:foreground ,hlchroma3 :weight bold))))
 `(web-mode-html-tag-bracket-face ((t (:foreground ,hlchroma3 :weight bold))))
 `(web-mode-html-attr-name-face ((t (:foreground ,hlchroma3))))

 ;; functions both when they are used, not defined

 `(font-lock-function-call-face ((t (:foreground ,fgchroma2 :slant italic))))
 `(web-mode-function-call-face ((t (:foreground ,fgchroma2 :slant italic))))
 ;; `(font-lock-function-name-face ((t (:weight bold :foreground "#fff"))))

 `(font-lock-variable-name-face ((t (:foreground ,fgchroma3 :weight regular))))
 `(web-mode-variable-name-face ((t (:foreground ,fgchroma3 :weight regular))))
 `(font-lock-function-name-face ((t (:foreground ,fgchroma3 :weight regular))))

 `(nxml-element-local-name ((t (:foreground ,bgchroma6))))
 `(nxml-tag-delimiter ((t (:foreground ,bgchroma5))))
 `(web-mode-html-tag-bracket-face ((t (:foreground ,bgchroma5))))
 `(nxml-text ((t (:foreground ,bgchroma6))))
 `(js2-object-property ((t (:slant italic :foreground ,fgchroma6))))
 `(js2-function-param ((t (:foreground ,fgchroma6))))
 `(font-lock-keyword-face ((t (:foreground ,fgchroma6))))
 `(font-lock-negation-char-face ((t (:weight bold :foreground ,fgchroma6))))
 `(font-lock-preprocessor-face ((t (:foreground ,fgchroma6))))
 `(font-lock-regexp-grouping-backslash ((t (:weight bold :foreground ,fgchroma5))))
 `(font-lock-regexp-grouping-construct ((t (:weight bold :foreground ,fgchroma6))))
 `(font-lock-string-face ((t (:foreground ,hlchroma1))))
 ;; `(font-lock-type-face ((t (:underline (:color foreground-color :style line) :foreground "#FFFFFF"))))
 `(font-lock-type-face ((t (:foreground ,bgchroma6))))
 `(font-lock-warning-face ((t (:weight bold :foreground ,war))))
 `(button ((t (:underline (:color foreground-color :style line)))))
 `(link ((t (:weight bold :underline (:color foreground-color :style line) :foreground ,fgchroma6))))
 `(link-visited ((t (:weight normal :underline (:color foreground-color :style line) :foreground ,fgchroma6))))
 `(tooltip ((((class color)) (:inherit (variable-pitch) :foreground ,bgchroma1 :background ,inf)) (t (:inherit (variable-pitch)))))

 `(mode-line          ((t (:height 80 :box nil :foreground ,bgchroma5 :background ,fgchroma6))))
 `(mode-line-inactive ((t (:height 80 :box nil :foreground ,fgchroma2 :background ,bgchroma6))))

 `(mode-line-buffer-id ((t (:foreground ,bgchroma5))))
 ;; `(mode-line-emphasis ((t (:weight bold))))
 `(mode-line-highlight ((((class color) (min-colors 88)) ) ))

 `(isearch ((t (:background ,hlchroma2))))
 `(isearch-fail ((t (:foreground ,fgchroma6 :background ,war))))
 `(lazy-highlight ((t (:weight bold :foreground ,fgchroma6 :background ,bgchroma4))))
 `(flycheck-warning-overlay ((t (:foreground ,fgchroma6 :background ,war))))
 `(flycheck-info-overlay ((t (:underline ,inf :background ,inf))))
 `(flycheck-info ((t (:underline ,inf :background ,inf))))

 `(flycheck-warning ((t (:foreground ,fgchroma3 :background ,war))))
 `(flycheck-error ((t (:foreground ,fgchroma3 :background ,err))))
 `(show-paren-mismatch ((t (:foreground ,fgchroma3 :background ,err))))
 `(rainbow-delimiters-mismatched-face ((t (:foreground ,fgchroma3 :background ,err))))
 `(cider-error-highlight-face ((t (:foreground ,fgchroma3 :background ,err))))

 `(cider-stacktrace-error-class-face ((t (:foreground ,err))))
 `(cider-repl-stderr-face ((t (:foreground ,err))))

 `(match ((t (:weight bold :foreground ,fgchroma6 :background ,bgchroma2))))

 ;; multiple cursor highlight:
 `(iedit-occurrence ((t (:background "cyan"))))
 `(next-error ((t (:inherit (region)))))
 `(rainbow-delimiters-depth-1-face ((t (:foreground ,bgchroma5))))
 `(rainbow-delimiters-depth-2-face ((t (:foreground ,bgchroma5))))
 `(rainbow-delimiters-depth-3-face ((t (:foreground ,bgchroma5))))

 ;; code blocks
`(org-block ((t (:family ,mono :weight light :height .8 :background ,bgchroma3))))
`(org-block-begin-line ((t (:foreground ,bgchroma6 :height .6 :slant italic))))
`(org-meta-line ((t (:foreground ,bgchroma6 :height .6 :slant italic))))

;; org-jupyter result blocks
`(org-code ((t (:family ,mono :foreground ,err :background ,bgchroma3 :height .8))))

`(org-link ((t (:foreground ,hlchroma1))))
`(org-roam-link ((t (:foreground ,hlchroma1))))

`(org-drawer ((t (:foreground ,bgchroma6 :height .5 :line-spacing 1))))
`(org-special-keyword ((t (:foreground ,bgchroma6 :height .5 :line-spacing 1))))
`(org-property-value ((t (:foreground ,bgchroma6 :height .5))) t)

;; indentation
`(org-hide ((t ( :height 1 )))) ;; the stars at the front of the headers, 1 means hidden?
 `(org-indent ((t (:background "orange" :height 1.1))))
 `(org-indent-level- ((t (:height 1.0))))

 `(org-indent-level-1 ((t (:height 1.0 :foreground ,bgchroma2))))
 `(org-indent-level-2 ((t (:height .8 :foreground ,bgchroma2))))
 `(org-indent-level-3 ((t (:height .7 :foreground ,bgchroma2))))
 `(org-indent-level-4 ((t (:height .7 :foreground ,bgchroma2))))
 `(org-indent-level-5 ((t (:height .6 :foreground ,bgchroma2))))
 `(org-indent-level-6 ((t (:height .6 :foreground ,bgchroma2))))

 `(header-line ((t (:inherit nil :height .2 :foreground ,obchroma1 :background ,bgchroma3)))) ;; doesnt seem to work

;; inlince code =like this= 
`(org-verbatim ((t (:height 1.0 :foreground ,fgchroma3 :family ,mono ))))

`(typescript-primitive-face ((t (:inherit (font-lock-type-face)))))

`(headers ((t (
	:family ,serif
	:foreground ,fgchroma1
	:weight bold
	       ))))

;;`(org-document-title ((t (:underline t))))
`(org-document-title ((t (
             :height 1.0
             ))))

`(org-level-1 ((t (
             :inherit (headers)
             :height 2.0
	:underline '(:color "red" :style line)
	     :weight bold
             ))))
`(markdown-header-face-1 ((t (:inherit (org-level-1)))))

`(org-level-2 ((t (
             :inherit (headers)
             :height 1.6
	:underline `(:color ,bgchroma4 :style line)
	     :weight regular
             ))))
`(markdown-header-face-2 ((t (:inherit (org-level-2)))))


`(org-level-3 ((t (
             :inherit (headers)
             :height 1.4
	:underline `(:color ,bgchroma4 :style line)
	     :weight regular
             ))))
`(markdown-header-face-3 ((t (:inherit (org-level-3)))))

`(org-level-4 ((t (
             :inherit (headers)
             :height 1.4
	:underline `(:color ,bgchroma4 :style line)
	     :weight regular
             ))))
`(markdown-header-face-4 ((t (:inherit (org-level-4)))))

`(org-level-5 ((t (
             :inherit (headers)
             :height 1.2
	:underline `(:color ,bgchroma4 :style line)
	     :weight regular
             ))))
`(markdown-header-face-5 ((t (:inherit (org-level-5)))))

`(org-level-6 ((t (
             :inherit (headers)
             :height 1.1
             :underline '(:color "red" :style wave)
             :weight regular
             ))))
`(markdown-header-face-6 ((t (:inherit (org-level-6)))))



`(highlight-indentation-face ((t (:background ,hlchroma1))))
`(highlight-indent-guides-even-face ((t (:background ,err))))
`(highlight-indent-guides-odd-face ((t (:background ,hlchroma1))))
`(highlight-indent-guides-character-face ((t (:foreground ,fgchroma3))))
`(highlight-indent-guides-top-character-face ((t (:foreground ,err))))
`(highlight-indent-guides-stack-character-face ((t (:foreground ,fgchroma6))))


`(org-document-info-keyword ((t (:foreground ,bgchroma6))))

`(org-todo ((t (:foreground ,err))))
`(org-tag ((t (:foreground ,hlchroma1))))
`(org-done ((t (:foreground ,hlchroma1))))
`(org-headline-done ((t (:foreground ,fgchroma3))))


`(org-agenda-date ((t (:foreground ,fgchroma4 :background ,bgchroma4 :underline t))))
`(org-agenda-date-today ((t (:foreground ,fgchroma1 :weight bold :background ,bgchroma4 :underline t))))
`(org-agenda-date-weekend ((t (:foreground ,fgchroma5 :background ,bgchroma4 :underline t))))

`(org-agenda-structure ((t (:family ,serif :foreground ,bgchroma6 :weight regular :height 1.2))))

`(org-agenda-done ((t (:foreground ,fgchroma6))))
`(org-scheduled-today ((t (:foreground ,fgchroma1, :background ,bgchroma1))))
`(git-commit-summary ((t (:foreground ,fgchroma1))))

`(org-table ((t (:inherit fixed-pitch))))
;; `(org-document-info ((t (:foreground "dark orange"))))
;; `(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
`(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold ))))

 `(auto-dim-other-buffers-face ((t (:background ,bgchroma3))))

 `(query-replace ((t (:inherit (isearch)))))))

(provide-theme 'mono-light)
