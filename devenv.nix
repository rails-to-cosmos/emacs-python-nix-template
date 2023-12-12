{ pkgs, ... }:

{
  env.LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
  env.USING_DEFAULT_PYTHON = 0;
  env.PIPENV_VENV_IN_PROJECT = 1;
  env.PIPENV_IGNORE_VIRTUALENVS = 1;
  env.SETUPTOOLS_USE_DISTUTILS = "stdlib";
  env.LANG = "en_US.UTF-8";

  packages = with pkgs; [
    python311Packages.python
    pyenv
    pipenv
    gcc
  ];

  scripts.wake.exec = ''
    pipenv install --dev
  '';

  scripts.py.exec = "pipenv run python3 $@";
  scripts.run.exec = "pipenv run $@";
  scripts.ruff.exec = "pipenv run ruff $@";
  scripts.ruff-lsp.exec = "pipenv run ruff-lsp $@";
  scripts.semgrep.exec = "pipenv run semgrep $@";
  scripts.pylsp.exec = "pipenv run pylsp $@";
  scripts.pyls.exec = "pipenv run pylsp $@";
  scripts.mypy.exec = "pipenv run mypy $@";
  scripts.mypy3.exec = "pipenv run mypy $@";
  scripts.pycodestyle.exec = "pipenv run pycodestyle $@";
  scripts.pyflakes.exec = "pipenv run pyflakes $@";
  scripts.flake8.exec = "pipenv run flake8 $@";
  scripts.pyright.exec = "pipenv run pyright $@";
  scripts.pylint.exec = "pipenv run pylint $@";
}
