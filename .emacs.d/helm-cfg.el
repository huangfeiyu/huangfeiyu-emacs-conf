(setq initial-scratch-message (concat initial-scratch-message
";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n;; This Emacs is Powered by `HELM' using\n;; emacs program \"emacs\".\n;; This is a minimal `helm' configuration to discover `helm' or debug it.\n;; You can retrieve this minimal configuration in \"/tmp/helm-cfg.el\".\n;;
;; Some original Emacs commands are replaced by their `helm' counterparts:\n\n;; - `find-file'(C-x C-f)            =>`helm-find-files'\n;; - `occur'(M-s o)                  =>`helm-occur'\n;; - `list-buffers'(C-x C-b)         =>`helm-buffers-list'\n;; - `completion-at-point'(M-tab)    =>`helm-lisp-completion-at-point'[1]\n;; - `apropos-command'(C-h a)        =>`helm-apropos'\n;; - `dabbrev-expand'(M-/)           =>`helm-dabbrev'\n;; - `execute-extended-command'(M-x) =>`helm-M-x'\n\n
;; Some other Emacs commands are \"helmized\" by `helm-mode'.\n;; [1] Coming with emacs-24.4, `completion-at-point' is \"helmized\" by `helm-mode'\n
;; which provides Helm completion in many places like `shell-mode'.\n;; Find context help for most Helm commands with `C-h m'.\n;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n\n"))

(setq load-path (quote ("/etc/emacs" "/usr/local/share/emacs/26.1/site-lisp" "/usr/local/share/emacs/site-lisp" "/usr/share/emacs/site-lisp/dictionaries-common" "/usr/share/emacs/site-lisp/cmake-data" "/usr/share/emacs/26.1/site-lisp" "/usr/share/emacs/site-lisp" "/usr/share/emacs/site-lisp/elpa" "/usr/share/emacs/site-lisp/elpa-src" "/usr/share/emacs/site-lisp/elpa/async-1.9.3" "/usr/share/emacs/site-lisp/elpa-src/async-1.9.3" "/usr/share/emacs/26.1/lisp" "/usr/share/emacs/26.1/lisp/vc" "/usr/share/emacs/26.1/lisp/url" "/usr/share/emacs/26.1/lisp/textmodes" "/usr/share/emacs/26.1/lisp/progmodes" "/usr/share/emacs/26.1/lisp/play" "/usr/share/emacs/26.1/lisp/org" "/usr/share/emacs/26.1/lisp/nxml" "/usr/share/emacs/26.1/lisp/net" "/usr/share/emacs/26.1/lisp/mh-e" "/usr/share/emacs/26.1/lisp/mail" "/usr/share/emacs/26.1/lisp/leim" "/usr/share/emacs/26.1/lisp/language" "/usr/share/emacs/26.1/lisp/international" "/usr/share/emacs/26.1/lisp/image" "/usr/share/emacs/26.1/lisp/gnus" "/usr/share/emacs/26.1/lisp/eshell" "/usr/share/emacs/26.1/lisp/erc" "/usr/share/emacs/26.1/lisp/emulation" "/usr/share/emacs/26.1/lisp/emacs-lisp" "/usr/share/emacs/26.1/lisp/cedet" "/usr/share/emacs/26.1/lisp/calendar" "/usr/share/emacs/26.1/lisp/calc" "/usr/share/emacs/26.1/lisp/obsolete")))
(require 'package)
;; User may be using a non standard `package-user-dir'.
;; Modify `package-directory-list' instead of `package-user-dir'
;; in case the user starts Helm from a non-ELPA installation.
(unless (file-equal-p package-user-dir (locate-user-emacs-file "elpa"))
  (add-to-list 'package-directory-list (directory-file-name
                                        (file-name-directory
                                         (directory-file-name default-directory)))))

(let* ((str-lst "")
       (load-packages (and str-lst
                           (not (string= str-lst ""))
                           (split-string str-lst ","))))
  (setq package-load-list
        (if (equal load-packages '("all"))
            '(all)
          (append '((helm-core t) (helm t) (async t) (popup t))
                  (mapcar (lambda (p) (list (intern p) t)) load-packages)))))

(package-initialize)
(add-to-list 'load-path (file-name-directory (file-truename "/usr/local/bin/helm")))
(unless (> -1 0)
   (setq default-frame-alist '((vertical-scroll-bars . nil)
                               (tool-bar-lines . 0)
                               (menu-bar-lines . 0)
                               (fullscreen . nil))))
(blink-cursor-mode -1)
(require 'helm-config)
(helm-mode 1)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(define-key global-map [remap execute-extended-command] 'helm-M-x)
(define-key global-map [remap apropos-command] 'helm-apropos)
(unless (boundp 'completion-in-region-function)
  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))
(add-hook 'kill-emacs-hook #'(lambda () (and (file-exists-p "/tmp/helm-cfg.el") (delete-file "/tmp/helm-cfg.el"))))
