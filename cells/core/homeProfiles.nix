{
  inputs,
  cell,
}: {
  default = {
    home.stateVersion = "23.11";

    xdg.enable = true;
    programs.gpg.enable = true;
    programs.ssh.enable = true;
  };

  gpg-agent = {pkgs, ...}: {
    services.gpg-agent = {
      enable = true;
      pinentryFlavor = "curses";
    };
    home.packages = with pkgs; [
      pinentry-curses
    ];
  };
}
