(deftheme mono-dark
  "Created 2020-03-09.")

(let ((bgchroma1 "#222222")
      ;; why is fff not white ?
      (bgchroma2 "#242424")
      (bgchroma3 "#2a2a2a")
      (bgchroma4 "#444444")
      (bgchroma5 "#555555")
      (bgchroma6 "#666666")

      (fgchroma1 "#ffffff")
      (fgchroma2 "#eeeeee")
      (fgchroma3 "#dddddd")
      (fgchroma4 "#cccccc")
      (fgchroma5 "#bbbbbb")
      (fgchroma6 "#aaaaaa")

      (inactiveback "#222222")

      (err "orangered")
      (war "orange")
      (inf "beige")
      ;; (comment "#dba")
      (comment "#555555")
      ;; (comment "#9bf")
      ;; (comment "#ac7")
      ;; (comment "lightsteelblue")

      (hlchroma1 "turquoise")
      (hlchroma2 "yellow")
      (hlchroma3 "lightslategrey")
      (obchroma1 "yellow")
      (obchroma2 "palevioletred")
      (obchroma3 "palevioletred"))


(custom-theme-set-faces
 'mono-dark
 `(default ((t (
		:foreground ,fgchroma3
		:background ,bgchroma2
		:stipple nil 
		:inherit nil))))
 `(cursor ((t (:background "turquoise"))))
 `(line-number ((t (:foreground ,bgchroma4))))
 `(line-number-current-line ((t (:foreground ,bgchroma6 :background ,bgchroma1))))
 `(vertical-border ((t (:foreground ,bgchroma2 :background ,bgchroma2))))

 ;; tiny little line between windows
 `(window-divider ((t (:foreground ,bgchroma3 :background ,bgchroma3))))
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
 `(font-lock-builtin-face ((t (:foreground ,bgchroma6))))
 `(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 `(font-lock-comment-face ((t (:foreground ,comment :slant italic :background ,inactiveback))))
 `(font-lock-constant-face ((t (:foreground ,obchroma1))))
 `(font-lock-doc-face ((t (:foreground ,fgchroma3))))

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
 `(header-line ((t (:inherit (mode-line)))))
 `(tooltip ((((class color)) (:inherit (variable-pitch) :foreground ,bgchroma1 :background ,inf)) (t (:inherit (variable-pitch)))))

 `(mode-line          ((t (:height 80 :box nil :foreground ,fgchroma6 :background ,bgchroma2))))
 `(mode-line-inactive ((t (:height 80 :box nil :foreground ,fgchroma2 :background ,bgchroma3))))

 `(mode-line-buffer-id ((t (:foreground ,fgchroma1))))
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
 `(match ((t (:weight bold :foreground ,fgchroma6 :background ,bgchroma2))))

 ;; multiple cursor highlight:
 `(iedit-occurrence ((t (:background "cyan"))))
 `(next-error ((t (:inherit (region)))))
 `(rainbow-delimiters-depth-1-face ((t (:foreground ,bgchroma5))))
 `(rainbow-delimiters-depth-2-face ((t (:foreground ,bgchroma6))))
 `(rainbow-delimiters-depth-3-face ((t (:foreground ,fgchroma6))))

`(org-block ((t (:inherit fixed-pitch :background ,bgchroma3))))
`(org-meta-line ((t (:inherit (fixed-pitch) :foreground ,bgchroma4 :background  ,bgchroma3))))

`(org-link ((t (:underline t :foreground ,hlchroma1))))
`(org-roam-link ((t (underline t :background ,inactiveback))))

`(org-drawer ((t (:background ,bgchroma1))))

;; indentation
;; `(org-hide ((t (:foreground "cadetblue" :family "Monospace" :height 1.0)))) ;; the stars at the front of the headers, 1 means hidden?
;; `(org-indent ((t (:foreground "orange" :background "blue" :family "Monospace" :height 1.0))))
`(org-hide ((t (:foreground ,fgchroma1 :weight bold :background ,bgchroma3))))

;; inlince code =like this= 
;;`(org-verbatim ((t (:height .8 :foreground ,fgchroma3 :background ,bgchroma3 :family "Monospace" ))))

`(org-document-title ((t (:underline t))))
`(org-document-info-keyword ((t (:underline t :foreground ,bgchroma6))))

`(org-todo ((t (:background ,err, :foreground ,fgchroma1))))
`(org-done ((t (:foreground "cadetblue"))))
`(org-headline-done ((t (:foreground ,fgchroma3))))

`(org-level-1 ((t (:height 1.0 :weight bold))))
`(markdown-header-face-1 ((t (:height 1.5 :weight regular))))
`(org-level-2 ((t (:height 1.0 :weight bold))))
`(markdown-header-face-2 ((t (:height 1.4 :weight regular))))
`(org-level-3 ((t (:height 1.0 :weight bold))))
`(markdown-header-face-3 ((t (:height 1.3 :weight regular))))
`(org-level-4 ((t (:height 1.0 :weight bold))))
`(markdown-header-face-4 ((t (:height 1.2 :weight regular))))
`(org-level-5 ((t (:height 1.0 :weight bold))))
`(markdown-header-face-5 ((t (:height 1.1 :weight regular))))

`(org-table ((t (:inherit fixed-pitch))))
`(org-document-info ((t (:foreground "dark orange"))))
`(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
`(org-property-value ((t (:inherit fixed-pitch))) t)
`(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
`(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold ))))
`(org-verbatim ((t (:inherit (shadow fixed-pitch)))))

 `(auto-dim-other-buffers-face ((t (:background ,bgchroma3))))

 `(query-replace ((t (:inherit (isearch)))))))

(provide-theme 'mono-dark)
