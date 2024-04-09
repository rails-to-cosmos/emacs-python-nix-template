{ pkgs, ... }:

{
  packages = with pkgs; [
    python311Full
    python311Packages.virtualenv
  ];

  enterShell = ''
    virtualenv .venv
    source $DEVENV_ROOT/.venv/bin/activate
    pip install poetry
    poetry install --with dev
  '';

  scripts.run-test.exec = ''
    set -e
    poetry run mypy .
    poetry run pytest . $@
  '';

  scripts.py.exec = "poetry run python $@";
  scripts.run.exec = "poetry run $@";
  scripts.ruff.exec = "poetry run ruff $@";
  scripts.ruff-lsp.exec = "poetry run ruff-lsp $@";
  scripts.semgrep.exec = "poetry run semgrep $@";
  scripts.pylsp.exec = "poetry run pylsp $@";
  scripts.pyls.exec = "poetry run pylsp $@";
  scripts.mypy.exec = "poetry run mypy $@";
  scripts.mypy3.exec = "poetry run mypy $@";
  scripts.pycodestyle.exec = "poetry run pycodestyle $@";
  scripts.pyflakes.exec = "poetry run pyflakes $@";
  scripts.flake8.exec = "poetry run flake8 $@";
  scripts.pyright.exec = "poetry run pyright $@";
  scripts.pylint.exec = "poetry run pylint $@";
}
