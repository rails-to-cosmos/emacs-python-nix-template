{ pkgs, ... }:

{
  env.LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
  env.USING_DEFAULT_PYTHON = 0;
  env.SETUPTOOLS_USE_DISTUTILS = "stdlib";
  env.LANG = "en_US.UTF-8";
  env.PYTHON_VERSION = "3.12";

  packages = with pkgs; [
    pyenv
    gcc
    jq
    cmake
  ];

  enterShell = ''
    pyenv install --skip-existing $PYTHON_VERSION
    pyenv local $PYTHON_VERSION
  '';

  scripts.wake.exec = ''
    pyenv exec python -m pip install --upgrade pip
    pyenv exec python -m pip install virtualenv
    pyenv exec python -m pip install poetry
    pyenv exec poetry install --with dev
  '';

  scripts.poetry.exec = "pyenv exec poetry $@";

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
