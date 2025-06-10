{ pkgs, config, ... }:

{
  programs.alacritty = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.alacritty);

    settings = {

      mouse = {
        hide_when_typing = true;
      };

      window = {
        padding = {
          x = 12;
          y = 12;
        };
        opacity = 0.80;
      };

      font = {
        size = 12.0;
      };

      colors = {
        primary = {
          background = "0x${config.colorScheme.colors.base00}";
          foreground = "0x${config.colorScheme.colors.base06}";
        };
        normal = {
          black   = "0x${config.colorScheme.colors.base00}";
          red     = "0xff0000";
          green   = "0x${config.colorScheme.colors.base0A}";
          yellow  = "0x${config.colorScheme.colors.base0E}";
          blue    = "0x${config.colorScheme.colors.base0C}";
          magenta = "0x${config.colorScheme.colors.base0D}";
          cyan    = "0x${config.colorScheme.colors.base0B}";
          white   = "0x${config.colorScheme.colors.base05}";
        };
        bright = {
          black   = "0x${config.colorScheme.colors.base00}";
          red     = "0xff0000";
          green   = "0x${config.colorScheme.colors.base0A}";
          yellow  = "0x${config.colorScheme.colors.base0E}";
          blue    = "0x${config.colorScheme.colors.base0C}";
          magenta = "0x${config.colorScheme.colors.base0D}";
          cyan    = "0x${config.colorScheme.colors.base0B}";
          white   = "0x${config.colorScheme.colors.base05}";
        };
      };
    };
  };
}
