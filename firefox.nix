{ ... }:

let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];

    policies = {

        ExtensionSettings = {
            "*".installation_mode = "blocked";

            "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = { # vimium
                install_url = "https://addons.mozilla.org/firefox/downloads/file/4259790/vimium_ff-2.1.2.xpi";
                installation_mode = "force_installed";
            };

            "{608b1b71-54d9-4606-87b6-ab2c8b48e708}" = { # one dark
                install_url = "https://addons.mozilla.org/firefox/downloads/file/3775372/one_dark-1.0.xpi";
                installation_mode = "force_installed";
            };

            "firefox-compact-dark@mozilla.org" = {
                install_url = "";
                installation_mode = "force_installed";
            };
        };

      Preferences = {
        "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
        "extensions.pocket.enabled" = lock-false;
        "extensions.screenshots.disabled" = lock-true;
      };

    };
  };
}
