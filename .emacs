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

;;(require 'evil-leader)
;;(global-evil-leader-mode)
(require 'evil)
(evil-mode 1)

;; =================================
;;   Set default settings
;; =================================

;; Disable menu bar
(menu-bar-mode -1)


;; =================================
;; eof
