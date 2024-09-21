{
  inputs,
  cell,
}: {
  default = {
    home.stateVersion = "24.05";

    xdg.enable = true;
    programs.gpg.enable = true;
    programs.ssh.enable = true;
  };

  gpg-agent = {pkgs, ...}: {
    # https://nix-community.github.io/home-manager/options.xhtml#opt-services.gpg-agent.enable
    services.gpg-agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-curses;
    };
  };

  chrome = {pkgs, ...}: {
    home.packages = with pkgs; [
      google-chrome
    ];

    # https://nixos.wiki/wiki/Wayland#Electron_and_Chromium
    home.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
