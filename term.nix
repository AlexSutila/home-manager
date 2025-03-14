{ config, ... }:

{
  home.file.".config/kitty/kitty.conf".text = ''
  window_padding_width 12
  enable_audio_bell no

  foreground #${config.colorScheme.colors.base06}
  background #${config.colorScheme.colors.base00}

  color0 #${config.colorScheme.colors.base00}
  color2 #${config.colorScheme.colors.base0A}
  color3 #${config.colorScheme.colors.base0E}
  color4 #${config.colorScheme.colors.base0C}
  color5 #${config.colorScheme.colors.base0D}
  color6 #${config.colorScheme.colors.base0B}
  color7 #${config.colorScheme.colors.base05}

  color10 #${config.colorScheme.colors.base0A}
  color11 #${config.colorScheme.colors.base0E}
  color12 #${config.colorScheme.colors.base0C}
  color13 #${config.colorScheme.colors.base0D}
  color14 #${config.colorScheme.colors.base0B}
  '';
}
