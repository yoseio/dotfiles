{
  inputs,
  cell,
}: {
  sakura = {
    bee = {
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs;
      home = inputs.home-manager;
    };

    imports = [
      ./hardwareConfigurations/sakura.nix

      inputs.cells.core.nixosProfiles.default
      inputs.cells.core.nixosProfiles.optimise

      inputs.cells.hardware.nixosProfiles.sound
      inputs.cells.hardware.nixosProfiles.nvidia

      inputs.cells.desktop.nixosProfiles.gnome

      inputs.cells.locale.nixosProfiles.ja-jp-core
      inputs.cells.locale.nixosProfiles.ja-jp-fonts

      inputs.cells.dev.nixosProfiles.docker
      inputs.cells.dev.nixosProfiles.keyring
    ];

    home-manager.users.yoseio = {
      imports = [
        inputs.cells.core.homeProfiles.default
        inputs.cells.core.homeProfiles.gpg-agent
        inputs.cells.core.homeProfiles.chrome

        inputs.cells.dev.homeProfiles.cli
        inputs.cells.dev.homeProfiles.zsh
        inputs.cells.dev.homeProfiles.git
        inputs.cells.dev.homeProfiles.gui
      ];

      home.packages = with inputs.nixpkgs.pkgs; [
        brave
        discord
        slack
        protonvpn-gui
      ];

      services.keybase = {
        enable = true;
      };
    };

    users.users = {
      root = {
        hashedPassword = "$y$j9T$fJZubI3HN5OduEbPRvz6k1$BD06AfBoz8nuAMVYqqpbW/ua.zo6Y2g8AkL42tpIlQ4";
      };

      yoseio = {
        isNormalUser = true;
        extraGroups = ["wheel" "docker" "dialout" "audio"];
        shell = inputs.nixpkgs.pkgs.zsh;
        hashedPassword = "$y$j9T$fJZubI3HN5OduEbPRvz6k1$BD06AfBoz8nuAMVYqqpbW/ua.zo6Y2g8AkL42tpIlQ4";
      };
    };

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    programs.zsh.enable = true;
  };
}
