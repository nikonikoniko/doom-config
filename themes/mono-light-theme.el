(deftheme mono-light
  "Created 2020-03-09.")

(let ((bgchroma1 "#fff")
      ;; why is fff not white ?
      (bgchroma2 "#f9f9f9")
      (bgchroma3 "#f5f5f5")
      (bgchroma4 "#dddddd")
      (bgchroma5 "#cccccc")
      (bgchroma6 "#bbbbbb")

      (fgchroma1 "#111")
      (fgchroma2 "#222")
      (fgchroma3 "#333")
      (fgchroma4 "#666")
      (fgchroma5 "#777")
      (fgchroma6 "#999")

      (err "orangered")
      (war "yellow")
      (inf "beige")
      ;; (comment "#dba")
      (comment "#9bf")
      ;; (comment "#ac7")
      ;; (comment "lightsteelblue")

      (hlchroma1 "cadetblue")
      (hlchroma2 "palevioletred")
      (hlchroma3 "#1e9c96")
      (obchroma1 "palevioletred")
      (obchroma2 "palevioletred")
      (obchroma3 "palevioletred"))


(custom-theme-set-faces
 'mono-light
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
 `(fringe ((t (:background ,bgchroma3))))

 `(fixed-pitch ((t (:family "Monospace"))))
 ;; `(neo-dir-link-face ((t (:family "Iosevka"))))
 ;; `(neo-file-link-face ((t (:family "Monospace"))))
 ;; `(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 `(escape-glyph ((t (:weight bold :foreground ,fgchroma6))))
 `(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 `(minibuffer-prompt ((t (:foreground ,fgchroma5))))
 ;; highlight is the line that you are on
 `(highlight ((t (:background ,bgchroma1))))
 ;; region is selected
 `(region ((t (:foreground ,bgchroma1 :background ,hlchroma1))))
 `(shadow ((t (:foreground ,fgchroma6))))
 `(secondary-selection ((t (:background ,bgchroma3))))
 `(trailing-whitespace ((t (:background ,err))))
 `(font-lock-builtin-face ((t (:foreground ,bgchroma6))))
 `(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 `(font-lock-comment-face ((t (:foreground ,comment :slant italic))))
 `(font-lock-constant-face ((t (:foreground ,obchroma1))))
 `(font-lock-doc-face ((t (:foreground ,fgchroma3))))
 ;; functions both when they are used, not defined
 `(font-lock-function-name-face ((t (:foreground ,fgchroma4 :slant italic))))
 `(web-mode-function-call-face ((t (:foreground ,fgchroma4 :slant italic))))
 ;; `(font-lock-function-name-face ((t (:weight bold :foreground "#fff"))))
 `(font-lock-variable-name-face ((t (:foreground ,fgchroma1))))
 `(web-mode-variable-name-face ((t (:foreground ,fgchroma1))))
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
 `(fringe ((t (:foreground ,fgchroma1 :background ,bgchroma4))))
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

`(org-block ((t (:inherit fixed-pitch :height 1.0))))
`(org-meta-line ((t (:inherit (fixed-pitch) :foreground ,bgchroma4))))

`(org-link ((t (underline t :background "beige"))))
`(org-roam-link ((t (underline t :background "beige"))))

`(org-drawer ((t (underline t :background "white"))))
;;`(org-hide ((t (underline t :background "white" ))))

`(org-document-title ((t (:height 1.6 :weight bold :underline t))))
`(org-document-info-keyword ((t (underline t :foreground ,bgchroma6))))

`(org-level-1 ((t (:height 1.5 :weight regular))))
`(org-level-2 ((t (:height 1.4 :weight regular))))
`(org-level-3 ((t (:height 1.3 :weight regular))))
`(org-level-4 ((t (:height 1.2 :weight regular))))
`(org-level-5 ((t (:height 1.1 :weight regular))))
`(org-table ((t (:inherit fixed-pitch))))
`(org-document-info ((t (:foreground "dark orange"))))
`(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
`(org-property-value ((t (:inherit fixed-pitch))) t)
`(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
`(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
`(org-verbatim ((t (:inherit (shadow fixed-pitch)))))

 `(auto-dim-other-buffers-face ((t (:background "white smoke"))))

 `(query-replace ((t (:inherit (isearch)))))))

(provide-theme 'mono-light)
