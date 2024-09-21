{
  inputs,
  cell,
}: {
  gnome = {pkgs, ...}: {
    dconf = {
      enable = true;
      settings = {
        # https://wiki.nixos.org/wiki/GNOME#Managing_extensions
        "org/gnome/shell" = {
          enabled-extensions = with pkgs.gnomeExtensions; [
            kimpanel.extensionUuid
          ];
        };

        # https://wiki.nixos.org/wiki/GNOME#Dark_mode
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      };
    };

    home.packages = with pkgs.gnomeExtensions; [
      kimpanel
    ];
  };
}
