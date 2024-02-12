{
  inputs,
  cell,
}: {
  default = {
    # OS Specific
    nix.useDaemon = true;
    security.pam.enableSudoTouchIdAuth = true;
    homebrew.enable = true;
    homebrew.masApps = {
      BetterSnapTool = 417375580;
      Xcode = 497799835;
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

  _1password = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      _1password
      _1password-gui
    ];
    homebrew.masApps = {
      "1Password for Safari" = 1569813296;
    };
  };

  dock = {
    system.defaults.dock.show-recents = false;
    system.defaults.dock.wvous-tr-corner = 2;
  };
}
