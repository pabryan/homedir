;; Dired settings
(require 'dired )

; allow copying between windows
(setq dired-dwim-target t)

; Don't create new buffers
(define-key dired-mode-map (kbd "<return>") 'dired-find-alternate-file) ; was dired-advertised-find-file
(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory

(add-hook 'dired-load-hook '(lambda () (require 'dired-x)))
(setq dired-omit-mode t)
