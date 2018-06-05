;; ============================================================================
;; ****************************************************************************
;;                          Henry's Emacs config
;;   - I'm brand new to emacs. This is a work-in-progress
;; ****************************************************************************
;; ============================================================================

;; Disable the tool & menu bars
(menu-bar-mode -1)
(tool-bar-mode -1)
;; Open Emacs as fullscreen by default
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; =================================
;;   Repositories
;; =================================

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Required (before package customizations)
(package-initialize)


;; =================================
;;   Packages
;; =================================

;; Evil <Leader>
;;(require 'evil-leader)
;;(global-evil-leader-mode)

;; Evil mode
(add-to-list 'load-path "~/.emacs.d/from_backup/evil")
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;; Undo Tree
;;(add-to-list 'load-path "~/.emacs.d/from_backup/undo-tree")
;;(global-undo-tree-mode)

;; Improved/custom Org mode bullets
(add-to-list 'load-path "~/.emacs.d/from_backup/org-bullets")
(require 'org-bullets)
(setq org-bullets-bullet-list
'("◉" "◎" "⚫" "○" "►" "◇"))
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; PHP mode
(add-to-list 'load-path "~/.emacs.d/from_backup/php-mode")
(require 'php-mode)


;; =================================
;;   Set default settings
;; =================================

(custom-set-variables
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces)


;; =================================
;; eof
