{
  inputs,
  cell,
}: {
  gnome = {
    # https://wiki.nixos.org/wiki/Category:Desktop_environment
    # https://wiki.nixos.org/wiki/GNOME

    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  };
}
