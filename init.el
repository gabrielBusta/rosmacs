;; load packages
(add-to-list 'load-path "/opt/ros/indigo/share/emacs/site-lisp")
(require 'rosemacs-config)

(add-to-list 'load-path "~/.emacs.d/packages/neotree")
(require 'neotree)

(add-to-list 'load-path "~/.emacs.d/packages/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode)

(add-to-list 'load-path "~/.emacs.d/packages/better-defaults")
(require 'better-defaults)

(add-to-list 'load-path "~/.emacs.d/packages/auto-complete")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/packages/auto-complete/dict")
(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/packages/evil-nerd-commenter")
(require 'evil-nerd-commenter)

;; KEY BINDINGS
(global-set-key (kbd "C-x n") 'neotree-toggle) ;; show file tree
;; for more information on ROS keybindings visit http://wiki.ros.org/rosemacs
(global-set-key "\C-x\C-r" ros-keymap)
;; Emacs key bindings
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

;; make .h open in c++ mode by default
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

; define the style I want to use in c++ mode
(c-add-style "gabriel-style" 
	     '("bsd" ; base style = bsd aka allman style
	      (indent-tabs-mode . nil) ; use spaces rather than tabs
	      (c-basic-offset . 2) ; indent by two spaces
	      (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
				  (brace-list-open . 0)
				  (statement-case-open . +)))))

(defun gabriel-c++-mode-hook ()
  (c-set-style "gabriel-style") ; use the c++ style defined above
  (auto-fill-mode)
  (c-syntactic-indentation nil)         
  (c-toggle-auto-hungry-state 1))

(add-hook 'c++-mode-hook 'gabriel-c++-mode-hook)

;; load theme and other GUI stuff
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'zenburn t)
;; (menu-bar-mode -1)
;; (toggle-scroll-bar -1)
(tool-bar-mode -1)
;; you can toggle line numbers using linum-mode
;; (global-linum-mode t) ; show line numbers on the side of the screen 
(setq column-number-mode t) ; showline and column number
(global-hl-line-mode 1) ; highligh the current line

;; disable emacs' chronic backupfile creation
(setq make-backup-files nil) 

;disable auto save
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)

;; ******* DO NOT TOUCH *******
;; automatically generated code
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; END OF AUTO GENERATED CODE
