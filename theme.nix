{ pkgs, config, ... }:

{

  home.file.".theme/palette.sh".text = ''
  #!/usr/bin/env bash
  black="#${config.colorScheme.colors.base00}"
  blue="#${config.colorScheme.colors.base0D}"
  yellow="#${config.colorScheme.colors.base0A}"
  red="#${config.colorScheme.colors.base08}"
  white="#${config.colorScheme.colors.base06}"
  green="#${config.colorScheme.colors.base0B}"
  visual_grey="#${config.colorScheme.colors.base01}"
  comment_grey="#${config.colorScheme.colors.base05}"
  '';

  home.file.".theme/palette.lua".text = ''
  local colors = {
    base00 = "#${config.colorScheme.colors.base00}",
    base01 = "#${config.colorScheme.colors.base01}",
    base02 = "#${config.colorScheme.colors.base02}",
    base03 = "#${config.colorScheme.colors.base03}",
    base04 = "#${config.colorScheme.colors.base04}",
    base05 = "#${config.colorScheme.colors.base05}",
    base06 = "#${config.colorScheme.colors.base06}",
    base07 = "#${config.colorScheme.colors.base07}",
    base08 = "#${config.colorScheme.colors.base08}",
    base09 = "#${config.colorScheme.colors.base09}",
    base0A = "#${config.colorScheme.colors.base0A}",
    base0B = "#${config.colorScheme.colors.base0B}",
    base0C = "#${config.colorScheme.colors.base0C}",
    base0D = "#${config.colorScheme.colors.base0D}",
    base0E = "#${config.colorScheme.colors.base0E}",
    base0F = "#${config.colorScheme.colors.base0F}",
  }
  return colors
  '';

}
