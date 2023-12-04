{ pkgs, ... }:

{
  env.LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
  env.USING_DEFAULT_PYTHON = 0;
  env.PIPENV_VENV_IN_PROJECT = 1;
  env.SETUPTOOLS_USE_DISTUTILS = "stdlib";

  packages = with pkgs; [
    python311Packages.python
    pyenv
    pipenv
    gcc
  ];

  enterShell = ''
    pipenv install --dev
  '';
}
