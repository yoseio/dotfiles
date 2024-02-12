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

  vbox = {
    virtualisation.virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
  };

  keyring = {pkgs, ...}: {
    # https://github.com/nix-community/home-manager/issues/1454
    services.gnome.gnome-keyring.enable = true;
    environment.systemPackages = with pkgs; [
      gnome.seahorse
    ];
  };

  cloudflared = {
    services.cloudflared = {
      enable = true;
      #tunnels = {
      #  "00000000-0000-0000-0000-000000000000" = {
      #    credentialsFile = "${config.sops.secrets.cloudflared-creds.path}";
      #    ingress = {
      #      "*.domain1.com" = {
      #        service = "http://localhost:80";
      #        path = "/*.(jpg|png|css|js)";
      #      };
      #      "*.domain2.com" = "http://localhost:80";
      #    };
      #    default = "http_status:404";
      #  };
      #};
    };
  };
}
