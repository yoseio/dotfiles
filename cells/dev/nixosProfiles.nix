{
  inputs,
  cell,
}: {
  docker = {pkgs, ...}: {
    # https://nixos.wiki/wiki/Docker

    virtualisation.docker = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };

  keyring = {pkgs, ...}: {
    # https://github.com/nix-community/home-manager/issues/1454
    services.gnome.gnome-keyring.enable = true;
    environment.systemPackages = with pkgs; [
      gnome.seahorse
    ];
  };
}
