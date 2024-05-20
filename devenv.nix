{ pkgs, ... }:

{
  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [pkgs.stdenv.cc.cc.lib];

  packages = with pkgs; [
    python312Full
    python312Packages.virtualenv
    python312Packages.pandas

    zlib
    stdenv.cc.cc
  ];

  enterShell = ''
    echo "Hello, fellow pythonista!"
    echo "Use \"init\" command to create a new project."
    echo "Use \"install-dev\" command to install the project to the system with development dependencies."
    echo "Use \"install-prod\" command to install the project to the production environment."
    echo "Happy hacking!"
    echo ""

    virtualenv $DEVENV_ROOT/.venv
    source $DEVENV_ROOT/.venv/bin/activate
  '';

  enterTest = ''
    virtualenv $DEVENV_ROOT/.venv

    mypy src
  '';

  scripts.init.exec = ''
    virtualenv $DEVENV_ROOT/.venv

    pip install poetry
    poetry init

    poetry add pytest mypy flake8 pdbpp pycompile pylint ruff semgrep types-pyyaml --group=dev
  '';

  scripts.install-dev.exec = ''
    virtualenv $DEVENV_ROOT/.venv

    poetry install --with dev
  '';

  scripts.install-prod.exec = ''
    virtualenv $DEVENV_ROOT/.venv

    poetry install
  '';
}
