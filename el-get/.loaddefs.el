;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "anzu/anzu" "anzu/anzu.el" (21974 33894 0 0))
;;; Generated autoloads from anzu/anzu.el

(autoload 'anzu-mode "anzu/anzu" "\
minor-mode which display search information in mode-line.

\(fn &optional ARG)" t nil)

(defvar global-anzu-mode nil "\
Non-nil if Global-Anzu mode is enabled.
See the command `global-anzu-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-anzu-mode'.")

(custom-autoload 'global-anzu-mode "anzu/anzu" nil)

(autoload 'global-anzu-mode "anzu/anzu" "\
Toggle Anzu mode in all buffers.
With prefix ARG, enable Global-Anzu mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Anzu mode is enabled in all buffers where
`anzu--turn-on' would do it.
See `anzu-mode' for more information on Anzu mode.

\(fn &optional ARG)" t nil)

(autoload 'anzu-query-replace-at-cursor "anzu/anzu" "\


\(fn)" t nil)

(autoload 'anzu-query-replace-at-cursor-thing "anzu/anzu" "\


\(fn)" t nil)

(autoload 'anzu-query-replace "anzu/anzu" "\


\(fn ARG)" t nil)

(autoload 'anzu-query-replace-regexp "anzu/anzu" "\


\(fn ARG)" t nil)

(autoload 'anzu-replace-at-cursor-thing "anzu/anzu" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil "el-get/el-get" "el-get/el-get.el" (21941 42425
;;;;;;  0 0))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-install "el-get/el-get" "\
Cause the named PACKAGE to be installed after all of its
dependencies (if any).

PACKAGE may be either a string or the corresponding symbol.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update "el-get/el-get" "\
Update PACKAGE.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-update-packages-of-type "el-get/el-get" "\
Update all installed packages of type TYPE.

\(fn TYPE)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-remove "el-get/el-get" "\
Remove any PACKAGE that is know to be installed or required.

\(fn PACKAGE)" t nil)

(autoload 'el-get-reinstall "el-get/el-get" "\
Remove PACKAGE and then install it again.

\(fn PACKAGE)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE)" t nil)

(autoload 'el-get-self-checksum "el-get/el-get" "\
Compute the checksum of the running version of el-get itself.

Also put the checksum in the kill-ring.

\(fn)" t nil)

(autoload 'el-get "el-get/el-get" "\
Ensure that packages have been downloaded once and init them as needed.

This will not update the sources by using `apt-get install' or
`git pull', but it will ensure that:

* the packages have been installed
* load-path is set so their elisp files can be found
* Info-directory-list is set so their info files can be found
* Autoloads have been prepared and evaluated for each package
* Any post-installation setup (e.g. `(require 'feature)') happens

When SYNC is nil (the default), all installations run
concurrently, in the background.

When SYNC is 'sync, each package will be installed synchronously,
and any error will stop it all.

Please note that the `el-get-init' part of `el-get' is always
done synchronously. There's `byte-compile' support though, and
the packages you use are welcome to use `autoload' too.

PACKAGES is expected to be a list of packages you want to install
or init.  When PACKAGES is omited (the default), the list of
already installed packages is considered.

\(fn &optional SYNC &rest PACKAGES)" nil nil)

;;;***

;;;### (autoloads nil "el-get/el-get-bundle" "el-get/el-get-bundle.el"
;;;;;;  (21941 42425 0 0))
;;; Generated autoloads from el-get/el-get-bundle.el

(autoload 'el-get-bundle-el-get "el-get/el-get-bundle" "\


\(fn SRC)" nil nil)

(autoload 'el-get-bundle "el-get/el-get-bundle" "\
Install PACKAGE and run initialization FORM.

PACKAGE can be either a simple package name or a package name
with a modifier before the name to specify local recipe source
information:

* `<owner>/' : specifies a Github owner name
* `gist:<id>' : specifies a Gist ID
* `<type>:' : specifies a type of the package source

If `FEATURE in PACKAGE' form is used instead of PACKAGE, then
that FEATURE is `require'd after installing PACKAGE.  You can
also use `el-get-bundle!' macro if FEATURE and PACKAGE are the
same.  If you wish to `require' more than one feature, then use
`:features' property in FORM.

The initialization FORM may start with a property list that
describes a local recipe.  The FORM after the property list is
treated as initialization code, which is actually an `:after'
property of the local recipe.

A copy of the initialization code is stored in a directory
specified by `el-get-bundle-init-directory' and its byte-compiled
version is used if `el-get-bundle-byte-compile' is non-nil.

\(fn PACKAGE &rest FORM)" nil t)

(put 'el-get-bundle 'lisp-indent-function 'defun)

(autoload 'el-get-bundle! "el-get/el-get-bundle" "\
Install PACKAGE and run initialization form.
It is the same as `el-get-bundle' except that PACKAGE is explicitly
required.

\(fn PACKAGE &rest ARGS)" nil t)

(put 'el-get-bundle! 'lisp-indent-function 'defun)

;;;***

;;;### (autoloads nil "el-get/el-get-check" "el-get/el-get-check.el"
;;;;;;  (21941 42425 0 0))
;;; Generated autoloads from el-get/el-get-check.el

(autoload 'el-get-check-recipe "el-get/el-get-check" "\
Check the format of the recipe.
Please run this command before sending a pull request.
Usage: M-x el-get-check-recipe RET

You can run this function from checker script like this:
    test/check-recipe.el PATH/TO/RECIPE.rcp

When used as a lisp function, FILE-OR-BUFFER must be a buffer
object or a file path.

\(fn FILE-OR-BUFFER)" t nil)

;;;***

;;;### (autoloads nil "el-get/el-get-list-packages" "el-get/el-get-list-packages.el"
;;;;;;  (21941 42425 0 0))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "expand-region/expand-region" "expand-region/expand-region.el"
;;;;;;  (21941 42694 0 0))
;;; Generated autoloads from expand-region/expand-region.el

(autoload 'er/expand-region "expand-region/expand-region" "\
Increase selected region by semantic units.

With prefix argument expands the region that many times.
If prefix argument is negative calls `er/contract-region'.
If prefix argument is 0 it resets point and mark to their state
before calling `er/expand-region' for the first time.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "expand-region/expand-region-custom" "expand-region/expand-region-custom.el"
;;;;;;  (21941 42694 0 0))
;;; Generated autoloads from expand-region/expand-region-custom.el

(let ((loads (get 'expand-region 'custom-loads))) (if (member '"expand-region/expand-region-custom" loads) nil (put 'expand-region 'custom-loads (cons '"expand-region/expand-region-custom" loads))))

(defvar expand-region-preferred-python-mode 'python "\
The name of your preferred python mode")

(custom-autoload 'expand-region-preferred-python-mode "expand-region/expand-region-custom" t)

(defvar expand-region-guess-python-mode t "\
If expand-region should attempt to guess your preferred python mode")

(custom-autoload 'expand-region-guess-python-mode "expand-region/expand-region-custom" t)

(defvar expand-region-autocopy-register "" "\
If set to a string of a single character (try \"e\"), then the
contents of the most recent expand or contract command will
always be copied to the register named after that character.")

(custom-autoload 'expand-region-autocopy-register "expand-region/expand-region-custom" t)

(defvar expand-region-skip-whitespace t "\
If expand-region should skip past whitespace on initial expansion")

(custom-autoload 'expand-region-skip-whitespace "expand-region/expand-region-custom" t)

(defvar expand-region-fast-keys-enabled t "\
If expand-region should bind fast keys after initial expand/contract")

(custom-autoload 'expand-region-fast-keys-enabled "expand-region/expand-region-custom" t)

(defvar expand-region-contract-fast-key "-" "\
Key to use after an initial expand/contract to contract once more.")

(custom-autoload 'expand-region-contract-fast-key "expand-region/expand-region-custom" t)

(defvar expand-region-reset-fast-key "0" "\
Key to use after an initial expand/contract to undo.")

(custom-autoload 'expand-region-reset-fast-key "expand-region/expand-region-custom" t)

(defvar expand-region-exclude-text-mode-expansions '(html-mode nxml-mode) "\
List of modes which derive from `text-mode' for which text mode expansions are not appropriate.")

(custom-autoload 'expand-region-exclude-text-mode-expansions "expand-region/expand-region-custom" t)

;;;***

;;;### (autoloads nil "flymake/flymake" "flymake/flymake.el" (21941
;;;;;;  53089 0 0))
;;; Generated autoloads from flymake/flymake.el

(autoload 'flymake-mode "flymake/flymake" "\
Toggle on-the-fly syntax checking.
With a prefix argument ARG, enable the mode if ARG is positive,
and disable it otherwise.  If called from Lisp, enable the mode
if ARG is omitted or nil.

\(fn &optional ARG)" t nil)

(autoload 'flymake-mode-on "flymake/flymake" "\
Turn flymake mode on.

\(fn)" nil nil)

(autoload 'flymake-mode-off "flymake/flymake" "\
Turn flymake mode off.

\(fn)" nil nil)

(autoload 'flymake-find-file-hook "flymake/flymake" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "helm-git-grep/helm-git-grep" "helm-git-grep/helm-git-grep.el"
;;;;;;  (21941 43528 0 0))
;;; Generated autoloads from helm-git-grep/helm-git-grep.el

(autoload 'helm-git-grep-run-persistent-action "helm-git-grep/helm-git-grep" "\
Run grep persistent action from `helm-git-grep'.

\(fn)" t nil)

(autoload 'helm-git-grep-run-default-action "helm-git-grep/helm-git-grep" "\
Run grep default action from `helm-git-grep'.

\(fn)" t nil)

(autoload 'helm-git-grep-run-other-window-action "helm-git-grep/helm-git-grep" "\
Run grep goto other window action from `helm-git-grep'.

\(fn)" t nil)

(autoload 'helm-git-grep-run-other-frame-action "helm-git-grep/helm-git-grep" "\
Run grep goto other frame action from `helm-git-grep'.

\(fn)" t nil)

(autoload 'helm-git-grep-run-elscreen-action "helm-git-grep/helm-git-grep" "\
Run grep goto elscreen action from `helm-git-grep'.

\(fn)" t nil)

(autoload 'helm-git-grep-run-save-buffer "helm-git-grep/helm-git-grep" "\
Run grep save results action from `helm-git-grep'.

\(fn)" t nil)

(autoload 'helm-git-grep-toggle-ignore-case "helm-git-grep/helm-git-grep" "\
Toggle ignore case option for git grep command from `helm-git-grep'.

\(fn)" t nil)

(autoload 'helm-git-grep-toggle-showing-trailing-leading-line "helm-git-grep/helm-git-grep" "\
Toggle show leading and trailing lines option for git grep.

\(fn)" t nil)

(autoload 'helm-git-grep-help "helm-git-grep/helm-git-grep" "\
Help command for `helm-git-grep'.

\(fn)" t nil)

(defvar helm-git-grep-mode-line-string "\\<helm-git-grep-map>\\[helm-git-grep-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct \\[helm-toggle-suspend-update]:Tog.suspend" "\
String displayed in mode-line in `helm-git-grep'.")

(autoload 'helm-git-grep "helm-git-grep/helm-git-grep" "\
Helm git grep.

if submodules exists, grep submodules too.

\(fn)" t nil)

(autoload 'helm-git-grep-at-point "helm-git-grep/helm-git-grep" "\
Helm git grep with symbol at point.

if submodules exists, grep submodules too.

\(fn)" t nil)

(autoload 'helm-git-grep-with-exclude-file-pattern "helm-git-grep/helm-git-grep" "\
Helm git grep with exclude file pattern.

file pattern is iterpreted as an POSIX extended regular expression.

if submodules exists, don't grep submodules.

\(fn)" t nil)

(autoload 'helm-git-grep-from-isearch "helm-git-grep/helm-git-grep" "\
Invoke `helm-git-grep' from isearch.

\(fn)" t nil)

(autoload 'helm-git-grep-from-helm "helm-git-grep/helm-git-grep" "\
Invoke `helm-git-grep' from other helm.

\(fn)" t nil)

(define-obsolete-function-alias 'helm-git-grep-from-here 'helm-git-grep-at-point "0.5")

;;;***

;;;### (autoloads nil "helm-gtags/helm-gtags" "helm-gtags/helm-gtags.el"
;;;;;;  (21941 43531 0 0))
;;; Generated autoloads from helm-gtags/helm-gtags.el

(autoload 'helm-gtags-clear-all-cache "helm-gtags/helm-gtags" "\


\(fn)" t nil)

(autoload 'helm-gtags-clear-cache "helm-gtags/helm-gtags" "\


\(fn)" t nil)

(autoload 'helm-gtags-next-history "helm-gtags/helm-gtags" "\
Jump to next position on context stack

\(fn)" t nil)

(autoload 'helm-gtags-previous-history "helm-gtags/helm-gtags" "\
Jump to previous position on context stack

\(fn)" t nil)

(autoload 'helm-gtags-select "helm-gtags/helm-gtags" "\


\(fn)" t nil)

(autoload 'helm-gtags-select-path "helm-gtags/helm-gtags" "\


\(fn)" t nil)

(autoload 'helm-gtags-tags-in-this-function "helm-gtags/helm-gtags" "\
Show tagnames which are referenced in this function and jump to it.

\(fn)" t nil)

(autoload 'helm-gtags-create-tags "helm-gtags/helm-gtags" "\


\(fn DIR LABEL)" t nil)

(autoload 'helm-gtags-find-tag "helm-gtags/helm-gtags" "\
Jump to definition

\(fn TAG)" t nil)

(autoload 'helm-gtags-find-tag-other-window "helm-gtags/helm-gtags" "\
Jump to definition in other window.

\(fn TAG)" t nil)

(autoload 'helm-gtags-find-rtag "helm-gtags/helm-gtags" "\
Jump to referenced point

\(fn TAG)" t nil)

(autoload 'helm-gtags-find-symbol "helm-gtags/helm-gtags" "\
Jump to the symbol location

\(fn TAG)" t nil)

(autoload 'helm-gtags-find-pattern "helm-gtags/helm-gtags" "\
Grep and jump by gtags tag files.

\(fn PATTERN)" t nil)

(autoload 'helm-gtags-find-files "helm-gtags/helm-gtags" "\
Find file from tagged with gnu global.

\(fn FILE)" t nil)

(autoload 'helm-gtags-find-tag-from-here "helm-gtags/helm-gtags" "\
Jump point by current point information.
Jump to definition point if cursor is on its reference.
Jump to reference point if curosr is on its definition

\(fn)" t nil)

(autoload 'helm-gtags-dwim "helm-gtags/helm-gtags" "\
Find by context. Here is
- on include statement then jump to included file
- on symbol definition then jump to its references
- on reference point then jump to its definition.

\(fn)" t nil)

(autoload 'helm-gtags-parse-file "helm-gtags/helm-gtags" "\
Parse current file with gnu global. This is similar to `imenu'.
You can jump definitions of functions, symbols in this file.

\(fn)" t nil)

(autoload 'helm-gtags-pop-stack "helm-gtags/helm-gtags" "\
Jump to previous point on the context stack and pop it from stack.

\(fn)" t nil)

(autoload 'helm-gtags-show-stack "helm-gtags/helm-gtags" "\
Show current context stack.

\(fn)" t nil)

(autoload 'helm-gtags-clear-stack "helm-gtags/helm-gtags" "\
Clear current context stack.

\(fn)" t nil)

(autoload 'helm-gtags-clear-all-stacks "helm-gtags/helm-gtags" "\
Clear all context stacks.

\(fn)" t nil)

(autoload 'helm-gtags-update-tags "helm-gtags/helm-gtags" "\
Update TAG file. Update All files with `C-u' prefix.
Generate new TAG file in selected directory with `C-u C-u'

\(fn)" t nil)

(autoload 'helm-gtags-resume "helm-gtags/helm-gtags" "\
Resurrect previously invoked `helm-gtags` command.

\(fn)" t nil)

(autoload 'helm-gtags-mode "helm-gtags/helm-gtags" "\
Toggle Helm-Gtags mode on or off.
With a prefix argument ARG, enable Helm-Gtags mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.
\\{helm-gtags-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-ls-git/helm-ls-git" "helm-ls-git/helm-ls-git.el"
;;;;;;  (21941 43534 0 0))
;;; Generated autoloads from helm-ls-git/helm-ls-git.el

(eieio-defclass-autoload 'helm-ls-git-source '(helm-source-in-buffer) "helm-ls-git/helm-ls-git" nil)

(eieio-defclass-autoload 'helm-ls-git-status-source '(helm-source-in-buffer) "helm-ls-git/helm-ls-git" nil)

(autoload 'helm-ls-git-ls "helm-ls-git/helm-ls-git" "\


\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "let-alist/let-alist" "let-alist/let-alist.el"
;;;;;;  (21941 53414 0 0))
;;; Generated autoloads from let-alist/let-alist.el

(autoload 'let-alist "let-alist/let-alist" "\
Let-bind dotted symbols to their cdrs in ALIST and execute BODY.
Dotted symbol is any symbol starting with a `.'.  Only those present
in BODY are let-bound and this search is done at compile time.

For instance, the following code

  (let-alist alist
    (if (and .title .body)
        .body
      .site
      .site.contents))

essentially expands to

  (let ((.title (cdr (assq 'title alist)))
        (.body  (cdr (assq 'body alist)))
        (.site  (cdr (assq 'site alist)))
        (.site.contents (cdr (assq 'contents (cdr (assq 'site alist))))))
    (if (and .title .body)
        .body
      .site
      .site.contents))

If you nest `let-alist' invocations, the inner one can't access
the variables of the outer one. You can, however, access alists
inside the original alist by using dots inside the symbol, as
displayed in the example above.

\(fn ALIST &rest BODY)" nil t)

(put 'let-alist 'lisp-indent-function '1)

;;;***

;;;### (autoloads nil "pkg-info/pkg-info" "pkg-info/pkg-info.el"
;;;;;;  (21941 53417 0 0))
;;; Generated autoloads from pkg-info/pkg-info.el

(autoload 'pkg-info-library-original-version "pkg-info/pkg-info" "\
Get the original version in the header of LIBRARY.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no X-Original-Version
header.

See Info node `(elisp)Library Headers' for more information
about library headers.

\(fn LIBRARY &optional SHOW)" t nil)

(autoload 'pkg-info-library-version "pkg-info/pkg-info" "\
Get the version in the header of LIBRARY.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no proper header.

See Info node `(elisp)Library Headers' for more information
about library headers.

\(fn LIBRARY &optional SHOW)" t nil)

(autoload 'pkg-info-defining-library-original-version "pkg-info/pkg-info" "\
Get the original version of the library defining FUNCTION.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

\(fn FUNCTION &optional SHOW)" t nil)

(autoload 'pkg-info-defining-library-version "pkg-info/pkg-info" "\
Get the version of the library defining FUNCTION.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

\(fn FUNCTION &optional SHOW)" t nil)

(autoload 'pkg-info-package-version "pkg-info/pkg-info" "\
Get the version of an installed PACKAGE.

If SHOW is non-nil, show the version in the minibuffer.

Return the version as list, or nil if PACKAGE is not installed.

\(fn PACKAGE &optional SHOW)" t nil)

(autoload 'pkg-info-version-info "pkg-info/pkg-info" "\
Obtain complete version info for LIBRARY and PACKAGE.

LIBRARY is a symbol denoting a named feature, or a library name
as string.  PACKAGE is a symbol denoting an ELPA package.  If
omitted or nil, default to LIBRARY.

If SHOW is non-nil, show the version in the minibuffer.

When called interactively, prompt for LIBRARY.  When called
interactively with prefix argument, prompt for PACKAGE as well.

Return a string with complete version information for LIBRARY.
This version information contains the version from the headers of
LIBRARY, and the version of the installed PACKAGE, the LIBRARY is
part of.  If PACKAGE is not installed, or if the PACKAGE version
is the same as the LIBRARY version, do not include a package
version.

\(fn LIBRARY &optional PACKAGE SHOW)" t nil)

;;;***

;;;### (autoloads nil "yasnippet/yasnippet" "yasnippet/yasnippet.el"
;;;;;;  (21941 42689 0 0))
;;; Generated autoloads from yasnippet/yasnippet.el

(autoload 'yas-minor-mode "yasnippet/yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, `yas-expand', normally bound to
the TAB key, expands snippets of code depending on the major
mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet/yasnippet" nil)

(autoload 'yas-global-mode "yasnippet/yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("dash/dash-functional.el" "dash/dash.el"
;;;;;;  "el-get/el-get-autoloading.el" "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el" "epl/epl.el"
;;;;;;  "expand-region/cc-mode-expansions.el" "expand-region/clojure-mode-expansions.el"
;;;;;;  "expand-region/cperl-mode-expansions.el" "expand-region/css-mode-expansions.el"
;;;;;;  "expand-region/enh-ruby-mode-expansions.el" "expand-region/er-basic-expansions.el"
;;;;;;  "expand-region/erlang-mode-expansions.el" "expand-region/expand-region-core.el"
;;;;;;  "expand-region/expand-region-pkg.el" "expand-region/feature-mode-expansions.el"
;;;;;;  "expand-region/html-mode-expansions.el" "expand-region/js-mode-expansions.el"
;;;;;;  "expand-region/js2-mode-expansions.el" "expand-region/jsp-expansions.el"
;;;;;;  "expand-region/latex-mode-expansions.el" "expand-region/nxml-mode-expansions.el"
;;;;;;  "expand-region/octave-expansions.el" "expand-region/python-el-expansions.el"
;;;;;;  "expand-region/python-el-fgallina-expansions.el" "expand-region/python-mode-expansions.el"
;;;;;;  "expand-region/ruby-mode-expansions.el" "expand-region/sml-mode-expansions.el"
;;;;;;  "expand-region/subword-mode-expansions.el" "expand-region/text-mode-expansions.el"
;;;;;;  "expand-region/the-org-mode-expansions.el" "expand-region/web-mode-expansions.el"
;;;;;;  "yasnippet/yasnippet-debug.el" "yasnippet/yasnippet-tests.el")
;;;;;;  (21974 33894 683582 0))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
