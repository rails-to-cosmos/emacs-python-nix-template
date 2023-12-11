;;; Directory Local Variables            -*- no-byte-compile: t -*-
;;; For more information see (info "(emacs) Directory Variables")

((python-mode . ((python-interpreter . "pipenv run python3")
                 (python-shell-interpreter-args . "run python3 -i")
                 (python-shell-interpreter . "pipenv")
                 (lsp-semgrep-server-command . '("pipenv" "run" "semgrep" "lsp"))
                 (lsp-pyls-server-command . '("pipenv" "run" "pylsp"))
                 (pipenv-with-flycheck . t))))
