{ pkgs, config, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];
    profiles.dorce = {

      # Plugins
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        vimium
      ];

      # Settings
      settings = {
        "extensions.pocket.enabled" = false;
        "extensions.screenshots.disabled" = true;
        "layout.css.prefers-color-scheme.content-override" = 0;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.toolbars.bookmarks.visibility" = false;
        "browser.ui.showBookmarkedTabs" = false;
        "ui.systemUsesDarkTheme" = 1;
        "browser.startup.homepage" = "https://www.github.com/AlexSutila";
      };

      userChrome = ''
        :root {
          --focus-outline-color: #${config.colorScheme.colors.base04} !important;
          --toolbar-color: #${config.colorScheme.colors.base07} !important;
          --tab-min-height: 30px !important;
        }
        /* Background of tab bar */
        .toolbar-items {
          background-color: #${config.colorScheme.colors.base00} !important;
        }
        /* Extra tab bar sides on macOS */
        .titlebar-spacer {
          background-color: #${config.colorScheme.colors.base00} !important;
        }
        .titlebar-buttonbox-container {
          background-color: #${config.colorScheme.colors.base00} !important;
        }
        #tabbrowser-tabs {
          border-inline-start: 0 !important;
        }
        /* Private Browsing indicator on macOS */
        #private-browsing-indicator-with-label {
          background-color: #${config.colorScheme.colors.base00} !important;
          margin-inline: 0 !important;
          padding-inline: 7px;
        }
        /* Tabs themselves */
        .tabbrowser-tab .tab-stack {
          border-radius: 5px 5px 0 0;
          overflow: hidden;
          background-color: #${config.colorScheme.colors.base00};
          color: #${config.colorScheme.colors.base06} !important;
        }
        .tab-content {
          border-bottom: 2px solid color-mix(in srgb, var(--identity-tab-color) 40%, transparent);
          border-radius: 5px 5px 0 0;
          background-color: #${config.colorScheme.colors.base00};
          color: #${config.colorScheme.colors.base06} !important;
        }
        .tab-content[selected] {
          border-bottom: 2px solid color-mix(in srgb, var(--identity-tab-color) 25%, transparent);
          background-color: #${config.colorScheme.colors.base01} !important;
          color: #${config.colorScheme.colors.base07} !important;
        }
        /* Below tab bar */
        #nav-bar {
          background: #${config.colorScheme.colors.base01} !important;
        }
        /* URL bar in nav bar */
        #urlbar[focused=true] {
          color: #${config.colorScheme.colors.base07} !important;
          background: #${config.colorScheme.colors.base02} !important;
          caret-color: #${config.colorScheme.colors.base05} !important;
        }
        #urlbar:not([focused=true]) {
          color: #${config.colorScheme.colors.base04} !important;
          background: #${config.colorScheme.colors.base02} !important;
        }
        #urlbar ::-moz-selection {
          color: #${config.colorScheme.colors.base07} !important;
          background: #${config.colorScheme.colors.base02} !important;
        }
        #urlbar-input-container {
          border: 1px solid #${config.colorScheme.colors.base01} !important;
        }
        #urlbar-background {
          background: #${config.colorScheme.colors.base01} !important;
        }
        /* Text in URL bar */
        #urlbar-input, #urlbar-scheme, .searchbar-textbox {
          color: #${config.colorScheme.colors.base07} !important;
        }
      '';
    };
  };
}
