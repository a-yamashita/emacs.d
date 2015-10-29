;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(defvar oldemacs-p (<= emacs-major-version 22))

(when oldemacs-p
  (defvar user-emacs-directory
    (expand-file-name (concat (getenv "HOME") "/.emacs.d/"))))


(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directry (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; elispとconfディレクトリをロ－ドパスに追加
;; (add-to-load-path "elisp" "conf")

(add-to-list 'load-path' "~/.emacs.d/elisp")
(add-to-list 'load-path' "~/.emacs.d/elpa")
(add-to-list 'load-path' "~/.emacs.d/conf")

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; add package archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; バックアップファイルの保存先を変更
(setq backup-directory-alist
  (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
        backup-directory-alist))

;; 自動保存ファイル(#...#)の保存先を変更
(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/.emacs.d/backup/") t)))

(exec-path-from-shell-initialize)

;; (install-elisp "http://www.emacswiki.org/emacs/download/auto-install.el")
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))



;; 暫定リ－ジョンモ－ドを有効にする
;; 何故かnilに設定すると有効になる…
(setq transient-mark-mode nil)

;; キ－バインド変更
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-t") 'other-window)
(define-key global-map (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "C-x <down>")  'windmove-down)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;; Macの場合Metaキーを入れ替える
(setq mac-option-key-is-meta t
      mac-command-key-is-meta nil
      mac-command-modifier 'super
      mac-option-modifier 'meta)

(setq default-input-method "MacOSX")

;; Macのクリップボードと同期する
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)


;; クレジット画面を表示しない
(setq inhibit-startup-screen t)

;; anything
;; (auto-install-batch "anything")
(when (require 'anything nil t)
  (setq
   anything-idle-delay 0.3
   anything-input-idle-delay 0.2
   anything-candidate-number-limit 100
   anything-quick-update t
   anything-enable-shortcut 'alphabet)

  (when (require 'anything-config nil t)
    (setq anything-su-or-sudo "sudo"))

  (require 'anything-match-plugin nil t)
  (and (equal current-language-environment "Japanese")
       (executable-find "cmigemo")
       (require 'anything-migemo nil t))
  (when (require 'anything-complete nil t)
    ;; (anything-read-string-mode 1)
    (anything-lisp-complete-symbol-set-timer 150))

  (require 'anything-show-completion nil t)

  (when (require 'auto-install nil t)
    (require 'anything-auto-install nil t))

  (when (require 'descbinds-anything nil t)
    (descbinds-anything-install))

  (require 'anything-grep nil t)
)  


;; Windowモードで起動した際の設定
(if window-system (progn
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;; asciiフォントをMenloに変更
(set-face-attribute 'default nil :family "Menlo" :height 120)

(set-language-environment "Japanese")
(require 'ucs-normalize)
(prefer-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; 日本語フォントをヒラギノ明朝ProNに変更
(set-fontset-font nil 'japanese-jisx0208
  (font-spec :family "Hiragino_Mincho_ProN"))

))

;; 行番号フォーマット
(setq linum-format "%4d")

;; 括弧の範囲内を強調表示
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;; 括弧の範囲色
(set-face-background 'show-paren-match-face "#1ABC9C")

;; 選択領域の色
(set-face-background 'region "#555")

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")


;; Emacs用ターミナル
;; (install-elisp "http://www.emacswiki.org/emacs/download/multi-term.el")
(when (require 'multi-term nil t)
  (setq multi-term-program shell-file-name)
)

;; Gitフロントエンド
(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")


;;php-mode
(load-library "php-mode")
(require 'php-mode)

(add-hook 'php-mode-hook
	  (lambda()
            (setq tab-width 4)
            (setq indent-tabs-mode nil)
            (setq c-basic-offset 4)
	    (require 'php-completion)
	    (php-completion-mode t)
	    (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
	    (when (require 'auto-complete nil t)
	      (make-variable-buffer-local 'ac-sources)
	      (add-to-list 'ac-sources 'ac-source-php-completion)
	      (auto-complete-mode t))))


;;server strt for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))

;; gtags-mode, anything-gtags
(setq gtags-prefix-key "\C-c")
(require 'gtags)
(require 'anything-gtags)
;; キーバインド
(setq gtags-mode-hook
      '(lambda ()
         (define-key gtags-mode-map "\C-cs" 'gtags-find-symbol)
         (define-key gtags-mode-map "\C-cr" 'gtags-find-rtag)
         (define-key gtags-mode-map "\C-ct" 'gtags-find-tag)
         (define-key gtags-mode-map "\C-cf" 'gtags-parse-file)
         (setq gtags-select-buffer-single t)
       )
)
;; gtags-mode を使いたい mode の hook に追加する
(add-hook 'php-mode-hook
          '(lambda()
             (gtags-mode 1)))

(require 'whitespace)
(set-face-foreground 'whitespace-space "DarkGoldenrod1")
(set-face-background 'whitespace-space nil)
(set-face-bold-p 'whitespace-space t)
(set-face-foreground 'whitespace-tab "DarkOliveGreen1")
(set-face-background 'whitespace-tab nil)
(set-face-underline  'whitespace-tab t)

(setq whitespace-style '(face tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))

(global-whitespace-mode 1); 全角スペースを常に表示
(global-set-key (kbd "C-x w") 'global-whitespace-mode) ; 全角スペース表示の切替

(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(require 'tramp)
(setq tramp-default-method "ssh")

(require 'scala-mode-auto)
(require 'scala-mode-feature-electric)
    (add-hook 'scala-mode-hook
        (lambda ()
        (scala-electric-mode)))


(el-get-bundle yasnippet)
;; (require 'yasnippet)
;; (setq yas-snippet-dirs
;;       '("~/.emacs.d/snippets"))
;; (yas-global-mode 1)


(el-get-bundle helm)
(el-get-bundle helm-git-grep)
(el-get-bundle helm-gtags)
(el-get-bundle helm-ls-git)
(require 'helm-config)
(helm-mode 1)
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "<tab>") 'helm-execute-persistent-action)

;; (el-get-bundle flycheck) -- not supported el-get
(add-hook 'after-init-hook #'global-flycheck-mode)

;; C-x C-fの拡張
;; (ffap-bindings)


(defun sqlf (start end)
  "リージョンのSQLを整形する"
  (interactive "r")
  (let ((case-fold-search t))
    (let* ((s (buffer-substring-no-properties start end))
           (s (replace-regexp-in-string "\\(select \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(update \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(insert into \\)\\(fuga\\)\\(fuga\\)" "\n\\2\n  " s))
           (s (replace-regexp-in-string "\\(delete from \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(create table \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(alter table \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(drop constraint \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(from \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(exists \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(where \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(values \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(order by \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(group by \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(having \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(left join \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(left outer join )\\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(right join \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(right outer join \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(inner join \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(cross join \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(union join \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(and \\)" "\n  \\1" s))
           (s (replace-regexp-in-string "\\(or \\)" "\n  \\1\n" s))
           (s (replace-regexp-in-string "\\(any \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(on update restrict \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(on update cascade \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(on update set null \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(on update no action \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(on delete restrict \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(on delete cascade \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(on delete set null \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(on delete no action \\)" "\n\\1\n  " s))
           (s (replace-regexp-in-string "\\(,\\)" "\n  \\1" s)))
    (save-excursion
      (insert s)))))


(el-get-bundle anzu)
(global-anzu-mode +1)
(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000))


;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; howm-mode
(add-to-list 'load-path' "~/.emacs.d/elisp/howm/")
(global-set-key (kbd "C-c , ,") 'howm-menu)
(setq howm-menu-lang 'ja)
(defvar howm-view-title-header "# ")  ; this should be evaluated in advance to handle markdown
(autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)

;; howmが生成するファイルの置き場所
(setq howm-home-directory "~/howm/")
;; キーワード一覧
(setq howm-keyword-file (concat howm-home-directory ".howm-keys"))
;; 履歴一覧
(setq howm-history-file (concat howm-home-directory ".howm-history"))
;; 編集をmarkdown-modeで行う
(defun markdown-text-mode ()
  (markdown-mode)       ; major
  (outline-minor-mode)  ; minor
)
(add-to-list 'auto-mode-alist '("\\.txt$" . markdown-text-mode))
; disable auto-fill-mode
(add-hook 'howm-mode-hook '(lambda () (auto-fill-mode -1)))
