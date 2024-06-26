{
  inputs,
  cell,
}: {
  default = {
    # OS Specific
    system.stateVersion = "24.05";

    # Common
    nix.settings.sandbox = true;
    nix.settings.trusted-users = ["@wheel"];
    nix.settings.allowed-users = ["@wheel"];
    nix.settings.experimental-features = ["nix-command" "flakes"];
  };

  optimise = {
    # https://nixos.wiki/wiki/Storage_optimization

    nix = {
      settings.auto-optimise-store = true;

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
    };
  };
}
