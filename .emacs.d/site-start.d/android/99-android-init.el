;;;;; Anroid
(setq android-ndk-root-path "/home/paul/development/android/android-ndk-r8b")
(setq android-sdk-root-path "/home/paul/development/android/android-sdk-linux")

(add-to-list 'load-path "/home/paul/.emacs.d/android-emacs-toolkit")
;(require 'androidmk-mode)
(add-hook 'androidmk-mode-hook
	  (lambda ()
	    (progn (local-set-key [M-f5] 'androidndk-build)
		   (local-set-key [M-S-f5] 'androidndk-rebuild)
		   (local-set-key [C-f5] 'androidsdk-build)
		   (local-set-key [C-S-f5] 'androidsdk-rebuild)
		   )))