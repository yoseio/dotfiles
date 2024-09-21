{
  inputs,
  cell,
}: {
  audio-pipewire = {pkgs, ...}: {
    # https://wiki.nixos.org/wiki/PipeWire

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  video-nvidia = {
    # https://wiki.nixos.org/wiki/Nvidia
    # https://wiki.nixos.org/wiki/CUDA

    hardware.graphics.enable = true;
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
    };
  };
}
