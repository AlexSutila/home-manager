{ config, pkgs, ... }:

{
  home.username = "dorce";
  home.homeDirectory = "/home/dorce";

  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    ./tmux.nix
    ./nvim.nix
  ];

  home.packages = [
    pkgs.ripgrep
    pkgs.zoxide
    pkgs.rsync
    pkgs.tree
    pkgs.fzf
    pkgs.gef # gdb extras
  ];

  home.file = {
    ".bash_aliases".source = ./bash_aliases;
    ".scripts".source = ./scripts;
  };

  programs.home-manager.enable = true;
}
