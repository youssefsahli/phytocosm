(add-to-list 'default-frame-alist '(font . "Input Mono-12"))
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package emacs
  :config
  (modify-all-frames-parameters
   '((internal-border-width . 32)
     (undecorated . t)))
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (pixel-scroll-precision-mode)
  :custom
  (setq scroll-preserve-screen-position 'always)
  (tab-always-indent 'complete)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (text-mode-ispell-word-completion nil)
  (mode-line-format nil)
  (ring-bell-function 'ignore)
  (custom-file "~/.emacs.d/custom.el")
  (backup-directory-alist `(("." . "~/.saves")))
  (delete-old-versions t)
  (kept-new-versions 10)
  (kept-old-versions 2)
  (version-control t)
  (gc-cons-threshold 402653184)
  (gc-cons-percentage 0.6)
  (lsp-warn-no-matched-clients nil)
  (kill-buffer-query-functions
   (delq 'process-kill-buffer-query-function
	 kill-buffer-query-functions)))

(use-package gcmh
  :config
  (gcmh-mode 1))

(use-package nerd-icons
  :custom
  (nerd-icons-font-family "RobotoMono Nerd Font Mono"))

(use-package all-the-icons)

(use-package fortune-cookie
  :init
  (setq fortune-file "/usr/share/fortunes"))

(use-package dashboard
  :custom
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-banner-logo-title (fortune-cookie))
  (dashboard-startup-banner "~/.emacs.d/bison.txt")
  (dashboard-center-content t)
  (dashboard-items '((recents . 5)
		     (projects . 5)))
  :custom-face
  (dashboard-footer-face ((t (:background "undefined"))))
  :config
  (dashboard-setup-startup-hook))

(use-package nano-modeline
  :hook
  ((prog-mode . nano-modeline-prog-mode)
   (text-mode . nano-modeline-text-mode)
   (org-mode  . nano-modeline-org-mode )))

(use-package nimbus-theme
  :custom
  (window-divider-default-right-width 1)
  (window-divider-default-bottom-width 1)
  (window-divider-default-places t)
  :config
  (load-theme 'nimbus t)
  (window-divider-mode))

;; Minibuffer completion (Vertico + Marginalia + Orderless)
(use-package marginalia
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle))
  :init (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package vertico
  :config
  (vertico-mode))

(use-package savehist
  :config
  (savehist-mode))

(use-package org)
(use-package nov
  :mode ("\\.epub\\'" . nov-mode)
  :custom-face
  (variable-pitch ((t (:family "Cascaydia NF")))))

(use-package ada-light-mode
  :straight (ada-light-mode
	     :type git
	     :host github
	     :repo "sebastianpoeplau/ada-light-mode"))

(use-package web-mode
  :custom
  (web-mode-exra-auto-pairs t)
  (web-mode-enable-auto-pairing t)
  :mode ("\\.phtml'"
	 "\\.tpl\\.php\\'"
	 "\\.[agj]sp\\'"
	 "\\.as[cp]x\\'"
	 "\\.erb\\'"
	 "\\.mustache\\'"
	 "\\.djhtml\\'"
	 "\\.html?\\'"
	 "\\.njk\\'")	 
  :hook web-mode)

(use-package racket-mode)
(use-package clojure-mode)
(use-package svelte-mode
  :config
  (defun svelte-mode-sgml-empty-tag-p-advice (old-function tag-name)
    "Advice function intended to wrap around `sgml-empty-tag-p

Makes case significant when checking whether tags need to be
closed or not, to not confuse elements with Svelte components."
    (if (eq major-mode 'svelte-mode)
	(assoc-string tag-name sgml-empty-tags)
      (funcall old-function tag-name)))

  (defun svelte-mode-sgml-unclosed-tag-p-advice (old-function tag-name)
    "Advice function intended to wrap around `sgml-unclosed-tag-p

Makes case significant when checking whether tags need to be
closed or not, to not confuse elements with Svelte components."
    (if (eq major-mode 'svelte-mode)
	(assoc-string tag-name sgml-unclosed-tags)
      (funcall old-function tag-name)))

  (advice-add 'sgml-empty-tag-p :around 'svelte-mode-sgml-empty-tag-p-advice)
  (advice-add 'sgml-unclosed-tag-p :around 'svelte-mode-sgml-unclosed-tag-p-advice)
  :custom
  (lsp-headerline-breadcrumb-enable nil))
(use-package cider)
(use-package smart-hungry-delete
  :bind (([remap backward-delete-char-untabify] .
	  smart-hungry-delete-backward-char)
	 ([remap delete-backward-char] .
	  smart-hungry-delete-backward-char)
	 ([remap delete-char] .
	  smart-hungry-delete-forward-char))
  :init (smart-hungry-delete-add-default-hooks))

(use-package which-key
  :config
  (which-key-mode))

(use-package rainbow-delimiters
  :config
  (rainbow-delimiters-mode))

(use-package rainbow-mode
  :hook prog-mode)

(use-package minions
  :config (minions-mode 1))

(use-package magit)
(use-package projectile
  :custom
  (projectile-project-search-path '("~/Projects"))
  :bind
  (:map projectile-mode-map
	("C-c p" . projectile-command-map)))

(use-package scroll-on-jump)
(use-package diminish)

(use-package git-gutter-fringe
  :diminish git-gutter-mode
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom)
  (global-git-gutter-mode t))

(use-package gitconfig)

(use-package undo-tree
  :diminish undo-tree-mode)

(use-package json-mode
  :config    (bind-keys :map json-mode-map
                        ("C-c i" . json-mode-beautify))
  :mode      ("\\.\\(json\\)$" . json-mode))

(use-package yaml-mode
  :mode ("\\.\\(yml\\|yaml\\|\\config\\|sls\\)$" . yaml-mode)
  :defer t)

(use-package helpful
  :config
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-h x") #'helpful-command)
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)
  (global-set-key (kbd "C-h F") #'helpful-function))

(use-package treemacs
  :custom
  (treemacs--icon-size 24)
  :custom-face
  (treemacs-root-face
   ((t (:weight regular
		:underline nil
		:foreground "#aaaaaa")))))

(use-package treemacs-icons-dired)
(use-package treemacs-nerd-icons
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons"))
(use-package treemacs-projectile
  :after (treemacs projectile))
(use-package treemacs-magit
  :after (treemacs magit))

;; lsp-mode
(use-package lsp-mode
  :custom
  (lsp-keymap-prefix "C-c l")
  :hook ((prog-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package tree-sitter)

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package lsp-ui
  :after (lsp-mode)
  :commands lsp-ui-mode)

(use-package lsp-treemacs)

(use-package treemacs-magit
  :after (treemacs magit))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  ;; Show the Embark target at point via Eldoc. You may adjust the
  ;; Eldoc strategy, if you want to see the documentation from
  ;; multiple providers. Beware that using this can be a little
  ;; jarring since the message shown in the minibuffer can be more
  ;; than one line, causing the modeline to move up and down:

  ;; (add-hook 'eldoc-documentation-functions #'embark-eldoc-first-target)
  ;; (setq eldoc-documentation-strategy #'eldoc-documentation-compose-eagerly)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package citar
  :custom
  (citar-bibliography '("~/Projects/Thesis/bib/library.bib"))
  :hook
  ((LaTeX-mode org-mode typst-ts-mode) . citar-capf-setup))

(use-package citar-embark
  :after citar embark
  :no-require
  :config (citar-embark-mode))

(use-package typst-ts-mode
  :straight '(:type git :host codeberg :repo "meow_king/typst-ts-mode"
                    :files (:defaults "*.el")))

(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode))

(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

(use-package move-text
  :init
  (move-text-default-bindings))

(use-package csv-mode)

(use-package pdf-tools
  :config
  (pdf-tools-install))

(use-package org-noter)

(use-package apheleia
  :hook web-mode
  :config
  (apheleia-global-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)))
