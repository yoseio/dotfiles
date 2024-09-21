{
  inputs,
  cell,
}: {
  docker = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/Docker

    virtualisation.docker = {
      enable = true;
    };
    environment.systemPackages = with pkgs; [
      docker-compose
    ];
  };
}
