{
  description = "purely functional dotfiles";

  nixConfig = {
    extra-experimental-features = "nix-command flakes";
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    std = {
      url = "github:divnix/std";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.devshell.follows = "devshell";
    };

    hive = {
      url = "github:yoseio/hive/yoseio";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    std,
    hive,
    ...
  } @ inputs:
    std.growOn {
      inherit inputs;

      nixpkgsConfig = {
        allowUnfree = true;
      };

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      cellsFrom = ./cells;

      cellBlocks = with std.blockTypes;
      with hive.blockTypes; [
        (functions "nixosProfiles")
        (functions "darwinProfiles")
        (functions "homeProfiles")

        nixosConfigurations
        darwinConfigurations
        # homeConfigurations

        (devshells "shells")
      ];
    }
    {
      nixosConfigurations = hive.collect self "nixosConfigurations";
      darwinConfigurations = hive.collect self "darwinConfigurations";
      # homeConfigurations = hive.collect self "homeConfigurations";
    }
    {
      devShells = hive.harvest self ["repo" "shells"];
    };
}
