{
  inputs,
  cell,
}: {
  default = {
    system.stateVersion = "24.05";

    # common
    nix.settings.sandbox = true;
    nix.settings.trusted-users = ["@wheel"];
    nix.settings.allowed-users = ["@wheel"];
    nix.extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # os specific
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };

  optimise = {
    # https://wiki.nixos.org/wiki/Storage_optimization
    nix.settings.auto-optimise-store = true;
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  _1password = {
    # https://wiki.nixos.org/wiki/1Password
    programs._1password.enable = true;
    programs._1password-gui.enable = true;
    programs.ssh.extraConfig = ''
      Host *
        IdentityAgent ~/.1password/agent.sock
    '';
  };
}
