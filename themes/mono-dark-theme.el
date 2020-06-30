(deftheme mono-dark
  "Created 2020-03-09.")

(let ((bgchroma1 "#222")
      (bgchroma2 "#333")
      (bgchroma3 "#444")
      (bgchroma4 "#555")
      (bgchroma5 "#666")
      (bgchroma6 "#777")
      (fgchroma1 "#aaa")
      (fgchroma2 "#bbb")
      (fgchroma3 "#ccc")
      (fgchroma4 "#ddd")
      (fgchroma5 "#eee")
      (fgchroma6 "#fff")
      (err "red")
      (war "orange")
      (inf "yellow")
      (comment "black")
      (hlchroma1 "#b4d9b8")
      (hlchroma2 "#b4d9b8")
      (hlchroma3 "#b4d9b8")
      (obchroma1 "#ffdcbd")
      (obchroma2 "#ffdcbd")
      (obchroma3 "#ffdcbd"))


(custom-theme-set-faces
 'mono-dark
 `(default ((t (
		:family "default" 
		:foundry "default" 
		:width normal 
		:height 1 
		:weight normal 
		:slant normal 
		:underline nil 
		:overline nil 
		:strike-through nil 
		:box nil 
		:inverse-video nil 
		:foreground ,fgchroma4
		:background "#333" 
		:stipple nil 
		:inherit nil))))
 `(cursor ((t (:foreground ,fgchroma6 :background ,hlchroma3))))
 `(line-number ((t (:foreground ,bgchroma3))))
 `(line-number-current-line ((t (:foreground ,bgchroma4 :background ,bgchroma1))))
 `(vertical-border ((t (:foreground ,bgchroma2 :background ,bgchroma2))))
 `(fixed-pitch ((t (:family "Monospace"))))
 `(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 `(escape-glyph ((t (:weight bold :foreground ,fgchroma6))))
 `(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 `(minibuffer-prompt ((t (:foreground ,fgchroma5))))
 `(highlight ((t (:background ,bgchroma1))))
 `(region ((t (:foreground ,bgchroma2 :background ,fgchroma5))))
 `(shadow ((t (:foreground ,bgchroma6))))
 `(secondary-selection ((t (:background ,bgchroma3))))
 `(trailing-whitespace ((t (:background ,err))))
 `(font-lock-builtin-face ((t (:foreground ,bgchroma6))))
 `(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 `(font-lock-comment-face ((t (:foreground ,comment :weight bold :slant italic))))
 `(font-lock-constant-face ((t (:foreground ,obchroma1))))
 `(font-lock-doc-face ((t (:foreground ,fgchroma3))))
 `(font-lock-function-name-face ((t (:foreground ,fgchroma6))))
 ;; `(font-lock-function-name-face ((t (:weight bold :foreground "#fff"))))
 `(font-lock-variable-name-face ((t (:foreground ,fgchroma6))))
 `(nxml-element-local-name ((t (:foreground ,bgchroma6))))
 `(nxml-tag-delimiter ((t (:foreground ,bgchroma5))))
 `(web-mode-html-tag-bracket-face ((t (:foreground ,bgchroma5))))
 `(nxml-text ((t (:foreground ,bgchroma6))))
 `(js2-object-property ((t (:slant italic :foreground ,fgchroma6))))
 `(js2-function-param ((t (:foreground ,fgchroma6))))
 `(font-lock-keyword-face ((t (:foreground ,bgchroma6))))
 `(font-lock-negation-char-face ((t (:weight bold :foreground ,fgchroma6))))
 `(font-lock-preprocessor-face ((t (:foreground ,fgchroma6))))
 `(font-lock-regexp-grouping-backslash ((t (:weight bold :foreground ,fgchroma5))))
 `(font-lock-regexp-grouping-construct ((t (:weight bold :foreground ,fgchroma6))))
 `(font-lock-string-face ((t (:foreground ,hlchroma1))))
 ;; `(font-lock-type-face ((t (:underline (:color foreground-color :style line) :foreground "#FFFFFF"))))
 `(font-lock-type-face ((t (:foreground ,fgchroma5))))
 `(font-lock-warning-face ((t (:weight bold :foreground ,war))))
 `(button ((t (:underline (:color foreground-color :style line)))))
 `(link ((t (:weight bold :underline (:color foreground-color :style line) :foreground ,fgchroma6))))
 `(link-visited ((t (:weight normal :underline (:color foreground-color :style line) :foreground ,fgchroma6))))
 `(fringe ((t (:foreground ,fgchroma1 :background ,bgchroma4))))
 `(header-line ((t (:inherit (mode-line)))))
 `(tooltip ((((class color)) (:inherit (variable-pitch) :foreground ,bgchroma1 :background ,inf)) (t (:inherit (variable-pitch)))))
 `(mode-line ((t (:box nil :foreground ,fgchroma2 :background ,bgchroma1))))
 `(mode-line-buffer-id ((t (:weight bold :foreground ,bgchroma2))))
 `(mode-line-emphasis ((t (:weight bold))))
 `(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color ,bgchroma3 :style released-button))) (t (:inherit (highlight)))))
 `(mode-line-inactive ((t (:box nil :foreground ,fgchroma2 :background ,bgchroma5))))
 `(isearch ((t (:background ,hlchroma2))))
 `(isearch-fail ((t (:foreground ,fgchroma6 :background ,war))))
 `(lazy-highlight ((t (:weight bold :foreground ,fgchroma6 :background ,bgchroma4))))
 `(flycheck-warning-overlay ((t (:foreground ,fgchroma6 :background ,war))))
 `(flycheck-info-overlay ((t (:underline ,inf :background ,inf))))
 `(flycheck-info ((t (:underline ,inf :background ,inf))))
 `(flycheck-warning ((t (:foreground ,fgchroma6 :background ,war))))
 `(flycheck-error ((t (:foreground ,fgchroma6 :background ,err))))
 `(match ((t (:weight bold :foreground ,fgchroma6 :background ,bgchroma2))))
 `(next-error ((t (:inherit (region)))))
 ;; multiple cursor highlight:
 `(iedit-occurrence ((t (:background "green"))))
 `(query-replace ((t (:inherit (isearch)))))))

(provide-theme 'mono-dark)
