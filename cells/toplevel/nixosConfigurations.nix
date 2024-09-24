{
  inputs,
  cell,
}: {
  sakura = { config, ... }: {
    bee = {
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs;
      home = inputs.home-manager;
    };

    imports = [
      ./hardwareConfigurations/sakura.nix

      inputs.cells.core.nixosProfiles.default
      inputs.cells.core.nixosProfiles.optimise
      inputs.cells.core.nixosProfiles._1password
      inputs.cells.core.nixosProfiles.cloudflared

      inputs.cells.desktop.nixosProfiles.gnome

      inputs.cells.dev.nixosProfiles.docker

      inputs.cells.hardware.nixosProfiles.audio-pipewire
      inputs.cells.hardware.nixosProfiles.video-nvidia

      inputs.cells.locale.nixosProfiles.ja-jp-core
      inputs.cells.locale.nixosProfiles.ja-jp-input
      inputs.cells.locale.nixosProfiles.ja-jp-font

      inputs.cells.secrets.nixosProfiles.sops
    ];

    home-manager.users.yoseio = {
      imports = [
        inputs.cells.core.homeProfiles.default
        inputs.cells.core.homeProfiles.gpg-agent
        inputs.cells.core.homeProfiles.chrome

        inputs.cells.desktop.homeProfiles.gnome

        inputs.cells.dev.homeProfiles.zsh
        inputs.cells.dev.homeProfiles.git
        inputs.cells.dev.homeProfiles.gui
      ];

      home.packages = with inputs.nixpkgs.pkgs; [
        discord
        slack
        protonvpn-gui
      ];

      services.keybase = {
        enable = true;
      };
    };

    users.mutableUsers = false;
    users.users = {
      root = {
        hashedPasswordFile = config.sops.secrets."users/root".path;
      };

      yoseio = {
        isNormalUser = true;
        extraGroups = ["wheel" "docker" "dialout" "audio"];
        shell = inputs.nixpkgs.pkgs.zsh;
        hashedPasswordFile = config.sops.secrets."users/yoseio".path;
      };
    };

    programs.zsh.enable = true;
  };
}
