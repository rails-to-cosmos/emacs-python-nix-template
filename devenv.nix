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
    source $DEVENV_ROOT/.venv/bin/activate
  '';

  scripts.init.exec = ''
    virtualenv .venv
    pip install poetry
    poetry add pytest mypy flake8 pdbpp pycodestyle pycompile pyflakes pylint python-lsp-server ruff ruff-lsp semgrep pytest-html types-pyyaml boto3-stubs --group=dev
    poetry install --with dev
    wake
  '';

  scripts.wake.exec = ''

  '';
}
