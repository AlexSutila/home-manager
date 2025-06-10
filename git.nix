{
  programs.git = {
    enable = true;
    extraConfig = {
      user = {
        name = "AlexSutila";
        email = "alexsutila2020@gmail.com";
      };
      url."git@github.com:AlexSutila/" = {
        insteadOf = "as:";
      };
      push = {
        autoSetupRemote = true;
        default = "current";
      };
      pull = {
        default = "current";
        rebase = true;
      };
    };
  };
}
