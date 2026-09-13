# Dotfiles

Chezmoi-managed configuration for a WSL Ubuntu 24.04 development environment.
The setup installs tmux, stable Neovim with LazyVim, Starship, opencode, and
Python/TypeScript runtimes. It does not store credentials or application state.

## Fresh Install

On Ubuntu 24.04 in WSL, install chezmoi, initialize the repository, and apply
the dotfiles:

```sh
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

The bootstrap may ask for `sudo` to install the small set of required Ubuntu
packages. Restart Bash after the first apply, then launch Neovim so LazyVim can
finish installing its plugins. Configure opencode authentication manually.

## Managed Files

- `~/.bashrc`
- `~/.tmux.conf`
- `~/.config/mise/config.toml`
- `~/.config/nvim/`
- `~/.config/starship.toml`

## Routine Workflow

Edit the file in your home directory normally, then import the change into the
chezmoi source repository. For example:

```sh
nvim ~/.bashrc
chezmoi add ~/.bashrc
chezmoi diff
chezmoi apply
chezmoi cd
git status
```

Update mise and its managed tools explicitly:

```sh
mise self-update
mise upgrade
```

Use LazyVim's update command for editor plugins and commit the resulting
`lazy-lock.json` changes after reviewing them.

## Diagnostics

```sh
chezmoi doctor
mise doctor
mise current
tmux -V
nvim --version
starship --version
opencode --version
```
