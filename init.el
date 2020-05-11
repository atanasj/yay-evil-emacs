;;; init.el --- Emacs init file
;;  Author: Ian Y.E. Pan
;;; Commentary:
;;; A lightweight Emacs config containing only the essentials: shipped with a custom theme!
;;; Code:
(defvar file-name-handler-alist-original file-name-handler-alist)

(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      file-name-handler-alist nil
      site-run-file nil
      max-specpdl-size 50000) ; problems with this so set here

(defvar ian/gc-cons-threshold 20000000)

(add-hook 'emacs-startup-hook ; hook run after loading init files
          (lambda ()
            (setq gc-cons-threshold ian/gc-cons-threshold
                  gc-cons-percentage 0.1
                  file-name-handler-alist file-name-handler-alist-original)))

(add-hook 'minibuffer-setup-hook (lambda ()
                                   (setq gc-cons-threshold (* ian/gc-cons-threshold 2))))
(add-hook 'minibuffer-exit-hook (lambda ()
                                  (garbage-collect)
                                  (setq gc-cons-threshold ian/gc-cons-threshold)))

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
(setq package-enable-at-startup nil)
(package-initialize)			

;; workaround bug in Emacs 26.2
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Setting up the package manager. Install if missing.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t))

;; Load main config file "./config.org"
(require 'org)
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; chage cursor from block to bar
;; from ansser: https://emacs.stackexchange.com/questions/392/how-to-change-the-cursor-type-and-color
(setq-default cursor-type '(bar . 3))

(server-start); start emacs in server mode so can list as editor

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(treemacs yasnippet-snippets yapfify yaml-mode writeroom-mode writegood-mode which-key use-package-chords undo-tree tablist restart-emacs rainbow-mode rainbow-delimiters quelpa-use-package pretty-hydra poly-R pfuture pcre2el paren-face pandoc-mode org-bullets openwith ob-applescript nyan-mode multiple-cursors magit lsp-ui lsp-python-ms lsp-ivy live-py-mode latex-preview-pane langtool json-mode ivy-yasnippet ivy-xref ivy-rich ivy-prescient ivy-hydra imenu-list imenu-anywhere iedit ido-vertical-mode ido-completing-read+ ibuffer-projectile hl-todo highlight-operators highlight-numbers highlight-indent-guides highlight-escape-sequences helpful golden-ratio general frog-menu font-lock+ flyspell-correct-ivy flyspell-correct-avy-menu flycheck flx-ido fix-word fd-dired exec-path-from-shell ess-view elisp-slime-nav eglot ebib dumb-jump drag-stuff doom-themes doom-modeline diredfl dired-subtree dired-rainbow dired-quick-sort dired-git-info diminish diff-hl dashboard crux counsel-projectile company-prescient company-lsp company-box company-auctex centaur-tabs bui biblio auto-package-update auto-dictionary auctex-latexmk amx all-the-icons-ivy all-the-icons-dired aggressive-indent ag adaptive-wrap ace-window ace-jump-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "#51afef" :height 4.0 :width normal :family "Menlo"))))
 '(ivy-minibuffer-match-face-1 ((t (:inherit font-lock-doc-face :foreground nil))))
 '(mc/cursor-bar-face ((t (:background "#51afef" :height 0.4 :width extra-condensed)))))
