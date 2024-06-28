{
  inputs,
  cell,
}: {
  default = {
    # OS Specific
    nix.useDaemon = true;
    security.pam.enableSudoTouchIdAuth = true;
    homebrew.enable = true;
    system.defaults.dock = {
      show-recents = false;
      wvous-tr-corner = 2;
    };

    # Common
    nix.settings.sandbox = true;
    nix.settings.trusted-users = ["@admin"];
    nix.settings.allowed-users = ["@admin"];
    nix.extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  optimise = {
    # https://nixos.wiki/wiki/Storage_optimization

    nix = {
      settings.auto-optimise-store = true;

      gc = {
        automatic = true;
        interval = {
          Weekday = 0;
          Hour = 0;
          Minute = 0;
        };
        options = "--delete-older-than 30d";
      };
    };
  };

  apps = {okgs, ...}: {
    # 1Password
    # BetterSnapTool
    # Chrome
    # Discord
    # Slack
    # Xcode

    homebrew.casks = [
      "1password-cli"
      "1password"
      "discord"
      "google-chrome"
      "slack"
    ];
    homebrew.masApps = {
      "1Password for Safari" = 1569813296;
      BetterSnapTool = 417375580;
      Xcode = 497799835;
    };
  };
}
