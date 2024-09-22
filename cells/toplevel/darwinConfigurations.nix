{
  inputs,
  cell,
}: {
  ume = {
    bee = {
      system = "x86_64-darwin";
      pkgs = inputs.nixpkgs;
      home = inputs.home-manager;
      darwin = inputs.nix-darwin;
    };

    imports = [
      inputs.cells.core.darwinProfiles.default
      inputs.cells.core.darwinProfiles.optimise

      inputs.cells.locale.darwinProfiles.ja-jp-core
      inputs.cells.locale.darwinProfiles.ja-jp-fonts
    ];

    home-manager.users.yoseio = {
      imports = [
        inputs.cells.core.homeProfiles.default

        inputs.cells.dev.homeProfiles.zsh
        inputs.cells.dev.homeProfiles.git
        inputs.cells.dev.homeProfiles.gui
      ];
    };

    users.users = {
      yoseio = {
        createHome = true;
        home = "/Users/yoseio";
        shell = inputs.nixpkgs.pkgs.zsh;
      };
    };

    homebrew.casks = [
      "1password-cli"
      "1password"
      "discord"
      "google-chrome"
      "slack"
    ];
    homebrew.masApps = {
      "1Password for Safari" = 1569813296;
      "Goodnotes 6" = 1444383602;
      "Swift Playgrounds" = 1496833156;
      "Xcode" = 497799835;
    };
  };
}
