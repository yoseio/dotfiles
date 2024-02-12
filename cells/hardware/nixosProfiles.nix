{
  inputs,
  cell,
}: {
  sound = {pkgs, ...}: {
    # https://nixos.wiki/wiki/ALSA
    # https://nixos.wiki/wiki/PulseAudio

    sound.enable = true;
    hardware.pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      extraConfig = ''
        load-module module-bluetooth-policy
        load-module module-bluetooth-discover
        load-module module-switch-on-connect
      '';
    };
  };

  nvidia = {
    # https://nixos.wiki/wiki/Nvidia

    services.xserver.videoDrivers = ["nvidia"];
    hardware.opengl.enable = true;
  };

  bluetooth = {pkgs, ...}: {
    # https://nixos.wiki/wiki/Bluetooth

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };

    services.blueman.enable = true;

    systemd.user.services.mpris-proxy = {
      description = "Mpris proxy";
      after = ["network.target" "sound.target"];
      wantedBy = ["default.target"];
      serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };
  };
}
