{ config, pkgs, inputs, nixgl, ... }:

{
  home.username = "dorce";
  home.homeDirectory = "/home/dorce";

  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./alacritty.nix
    ./vscode.nix
    ./nvim.nix
    ./term.nix # Just for themes, nothing else
    ./tmux.nix
    ./theme.nix
    ./git.nix
  ];
  colorScheme = inputs.nix-colors.colorSchemes.black-metal;
  nixGL.packages = import nixgl { inherit pkgs; };
  nixGL.defaultWrapper = "mesa"; # or the driver you need
  nixGL.installScripts = [ "mesa" ];

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
    ".local/bin".source = ./scripts;
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
