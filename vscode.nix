{ pkgs, inputs, ... }:

# I do not use this much, the only exception being anything related to juypter notebooks, hence
# there isn't a whole lot going on. Pretty straight forward, don't care too much.
{
  programs.vscode =
  {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      ms-toolsai.jupyter
      vscodevim.vim
    ];

    # I would, but having this json file stuck with read-only permissions is kinda problematic
    # userSettings = {
    #   "workbench.colorTheme" = "Catppuccin Mocha"; # Color scheme
    #   "window.menuBarVisibility" = "hidden"; # This looks terrible, hiding it is my hacky fix
    # };
  };
}
