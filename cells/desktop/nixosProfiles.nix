{
  inputs,
  cell,
}: {
  gnome = {
    # https://nixos.wiki/wiki/GNOME

    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
  };
}
