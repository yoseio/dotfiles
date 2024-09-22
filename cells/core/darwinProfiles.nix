{
  inputs,
  cell,
}: {
  default = {
    system.stateVersion = 5;

    # common
    nix.settings.sandbox = true;
    nix.settings.trusted-users = ["@admin"];
    nix.settings.allowed-users = ["@admin"];
    nix.extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # os specific
    nix.useDaemon = true;
    security.pam.enableSudoTouchIdAuth = true;
    homebrew.enable = true;
    homebrew.onActivation.cleanup = "zap";
  };

  optimise = {
    # https://wiki.nixos.org/wiki/Storage_optimization

    nix.settings.auto-optimise-store = true;
    nix.gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 0; Minute = 0; };
      options = "--delete-older-than 30d";
    };
  };
}
