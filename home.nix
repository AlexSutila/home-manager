{ config, pkgs, inputs, ... }:

{
  home.username = "dorce";
  home.homeDirectory = "/home/dorce";

  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./firefox.nix
    ./vscode.nix
    ./nvim.nix
    ./term.nix # Just for themes, nothing else
    ./tmux.nix
  ];
  colorScheme = inputs.nix-colors.colorSchemes.onedark;
  # colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
  # colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  home.packages = [
    pkgs.xdg-utils
    pkgs.obsidian # for note-taking
    pkgs.starship # bash prompt
    pkgs.ripgrep
    pkgs.zathura
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
