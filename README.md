# dotfiles

Personal configuration files.

## Contents

```
.
├── claude.md      → ~/.claude/claude.md
├── promptrc       → ~/.promptrc
├── vimrc          → ~/.vimrc
├── zshrc          → ~/.zshrc
└── vscode/
    ├── settings.json     → ~/Library/Application Support/Code/User/settings.json
    ├── keybindings.json  → ~/Library/Application Support/Code/User/keybindings.json
    └── extensions.txt
```

## Install

```bash
./install.sh
```

## VSCode Extensions

Restore extensions from list:

```bash
cat vscode/extensions.txt | xargs -L 1 code --install-extension
```

Export current extensions:

```bash
code --list-extensions > vscode/extensions.txt
```
