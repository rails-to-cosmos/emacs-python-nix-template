# emacs-python-nix-template

This repository provides a template for setting up a Python development environment in Emacs, leveraging `poetry`, `nix`, and Emacs' `python-mode` with `lsp` (Language Server Protocol) integration. This setup aims to streamline the development process and ensure consistent environments across different setups.

## Features

1. **Emacs Configuration**: Includes a `.dir-locals.el` file to automatically configure Emacs `python-mode` and `lsp` for use with `poetry`. This ensures that the python interpreter and language servers (like `semgrep` and `pyls`) are correctly pointed to the virtual environment created by `poetry`.

2. **Pipenv Environment**: A sample `Pipfile` is provided which includes necessary Python language servers and other common dependencies for Python development.

3. **Nix Development Environment**: A `devenv.nix` file is included to manage system libraries and environment variables specific to the project. This aids in creating a reproducible development environment.

4. **Local Customization**: Users can create a `.envrc.local` file for customizing the development environment locally. This file is ignored by version control, allowing for individual preferences without affecting the main project setup.

## Setup Instructions

### Initial setup

1. Run `wake` command to install project dependencies.

### Emacs Configuration

1. Ensure Emacs is installed with `python-mode` and `lsp-mode`.
2. Place the `.dir-locals.el` file in the root of your project directory.
3. Open a Python file within the project, and Emacs will automatically configure the Python environment and LSP settings based on `poetry`.

### Nix Development Environment

1. Install `nix` if not already installed.
2. Run `nix-shell devenv.nix` to enter the development environment managed by Nix. This will set up all required system libraries and environment variables.

### Local Customization

- Create a `.envrc.local` file at the root of your project to override or augment the settings in the `.envrc` file.
- This file should be used for settings that are specific to your local development environment and should not be committed to version control.

## Contributing

Contributions to improve this template are welcome. Please submit issues and pull requests with your suggestions and improvements.

Enjoy a seamless Python development experience in Emacs with `emacs-python-nix-template`!
