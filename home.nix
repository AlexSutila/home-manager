{ config, pkgs, ... }:

{
  home.username = "dorce";
  home.homeDirectory = "/home/dorce";

  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    ./vscode.nix
    ./tmux.nix
    ./nvim.nix
  ];

  home.packages = [
    pkgs.obsidian # for note-taking
    pkgs.starship # bash prompt
    pkgs.jupyter
    pkgs.ripgrep
    pkgs.zoxide
    pkgs.rsync
    pkgs.xclip
    pkgs.tree
    pkgs.fzf
    pkgs.gef # gdb extras
  ];

  home.file = {
    ".bash_aliases".source = ./bash_aliases;
    ".scripts".source = ./scripts;
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
