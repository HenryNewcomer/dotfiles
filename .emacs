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

;; Disable the tool & menu bars
(menu-bar-mode -1)
(tool-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(package-selected-packages (quote (php-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; =================================
;; eof
