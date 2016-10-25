;; Start gnuserv
(server-start)

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
(put 'upcase-region 'disabled nil)
;; Tell emacs where is your personal elisp lib dir
;; this is the dir you place all your extra packages

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/ljupdate/")
(add-to-list 'load-path "~/.emacs.d/emms/")
(add-to-list 'load-path "~/.emacs.d/scala-mode2/")
(add-to-list 'load-path "~/.emacs.d/haskell-mode/")
;;(add-to-list 'load-path "~/.emacs.d/emacs-w3m/")

;; path to our Maildir directory
(setq mu4e-maildir "/home/vrs/mail")

;; keybinding for auto-fill-mode
(global-set-key [f12] 'auto-fill-mode)

;; keybinding for org-mode
(global-set-key [f11] 'org-mode)

;; keybinding for auto-fill-mode
(global-set-key [f9] 'fundamental-mode)

;; keybinding for auto-fill-mode
(global-set-key [f8] 'text-mode)

;; keybinding forf flipping through the frames
;; substitute for C-x o or C-u [number] C-x o
(global-set-key (kbd "C-x <down>") 'previous-multiframe-window)
(global-set-key (kbd "C-x <up>") 'next-multiframe-window)

;; show column number
(column-number-mode t)

;; highlight parenthes
(show-paren-mode t)

;; editing of compressed files
(auto-compression-mode t)

;; set default browser
(setq browse-url-browser-function 'w3m-browse-url)

;; cyrillic environment by toggle-input-method
(setq default-input-method "russian-computer")

;; turn on pending delete (when a region is selected, typing replaces it)
(delete-selection-mode t)

;; line enumaration
(global-linum-mode 1)
(setq linum-format "%d ")

;; highlight current line
(global-hl-line-mode 1)

;; Color themes
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;(require 'darcula-theme)
(load-theme 'afternoon t)

;; set mouse color
(set-mouse-color "dark orange")

;; Global clipboard use
(setq x-select-enable-clipboard t)

;; spellcheck with aspell
(setq-default ispell-program-name "aspell")

;; hide toolbar
(tool-bar-mode 0)

;; Make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; Display clock 
(display-time)

;;
;; extensions
;;

;; package manager, >= emacs 24
(require 'package)
(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))

;; You don't need this one if you prefer marmalade and released versions:
;; (add-to-list 'package-archives
;;  '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; smtp
(require 'smtpmail)

;; notmuch
;;(require 'notmuch)

;; mu4e
(require 'mu4e)

;; lorem ipsum
(require 'lorem-ipsum)

;; php-mode
(require 'php-mode)

;; scala-mode2
(require 'scala-mode2)

;; haskell-mode
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/haskell-mode/")

;; livejournal
(require 'ljupdate)

;; EMMS player
     (require 'emms-setup)
     (emms-standard)
     (emms-default-players)

;; w3m browser
(require 'w3m-load)
;;(require 'mime-w3m)

;; OrgMode
(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
     (global-set-key "\C-cc" 'org-capture)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cb" 'org-iswitchb)

;;(setq org-todo-keywords
;;'(("TODO(t)" "WAIT(w)" "|" "DONE(d)" "CANCELED(c)")))
(setq org-log-done 'time)

;; org-capture templates
     (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/docs/org/todo.org" "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("n" "Notes" entry (file+datetree "~/docs/org/notes.org")
             "* %?\nEntered on %U\n  %i\n  %a")))

;; Mutt support
(setq auto-mode-alist (append '(("/tmp/mutt.*" . mail-mode)) auto-mode-alist))

;; Multitran dictionary
(defconst multitran-en-url-prefix "http://www.multitran.ru/c/m.exe?l1=1&l2=2&HL=2&EXT=0&s=")

(defun multitran-en ()
  (interactive)
  (let ((word (current-word)))
    (browse-url (concat multitran-en-url-prefix word) t)))

(defconst multitran-fr-url-prefix "http://www.multitran.ru/c/m.exe?l1=4&l2=2&HL=2&EXT=0&s=")

(defun multitran-fr ()
  (interactive)
  (let ((word (current-word)))
    (browse-url (concat multitran-fr-url-prefix word) t)))

(defconst multitran-de-url-prefix "http://www.multitran.ru/c/m.exe?l1=3&l2=2&HL=2&EXT=0&s=")
(defun multitran-de ()
  (interactive)
  (let ((word (current-word)))
    (browse-url (concat multitran-de-url-prefix word) t)))

(defconst multitran-es-url-prefix "http://www.multitran.ru/c/m.exe?l1=5&l2=2&HL=2&EXT=0&s=")
(defun multitran-es ()
  (interactive)
  (let ((word (current-word)))
    (browse-url (concat multitran-es-url-prefix word) t)))
