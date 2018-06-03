;; ============================================================================
;; ****************************************************************************
;;                          Henry's Emacs config
;;   - I'm brand new to emacs. This is a work-in-progress
;; ****************************************************************************
;; ============================================================================

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
(add-to-list 'load-path "~/.emacs.d/evil")
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;; Undo Tree
;;(add-to-list 'load-path "~/.emacs.d/undo-tree")
;;(global-undo-tree-mode)

;; =================================
;;   Set default settings
;; =================================

;; Disable menu bar
(menu-bar-mode -1)


;; =================================
;; eof
