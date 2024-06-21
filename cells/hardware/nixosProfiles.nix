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
    };
  };

  nvidia = {
    # https://nixos.wiki/wiki/Nvidia

    services.xserver.videoDrivers = ["nvidia"];
    hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
    };
  };
}
