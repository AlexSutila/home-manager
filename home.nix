{ config, pkgs, ... }:

{
  home.username = "dorce";
  home.homeDirectory = "/home/dorce";

  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    ./firefox.nix
    ./vscode.nix
    ./tmux.nix
    ./nvim.nix
  ];

  home.packages = [
    pkgs.xdg-utils
    pkgs.obsidian # for note-taking
    pkgs.starship # bash prompt
    pkgs.ripgrep
    pkgs.zoxide
    pkgs.rsync
    pkgs.scrot # screenshots - helpful for note taking
    pkgs.xclip
    pkgs.tree
    pkgs.fzf
  ];

  home.file = {
    ".bash_aliases".source = ./bash_aliases;
    ".scripts".source = ./scripts;
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
