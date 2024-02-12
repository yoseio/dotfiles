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
      inputs.cells.core.darwinProfiles._1password
      inputs.cells.core.darwinProfiles.dock

      inputs.cells.locale.darwinProfiles.ja-jp-core
      inputs.cells.locale.darwinProfiles.ja-jp-fonts
    ];

    home-manager.users.yoseio = {
      imports = [
        inputs.cells.core.homeProfiles.default

        inputs.cells.dev.homeProfiles.cli
        inputs.cells.dev.homeProfiles.zsh
        inputs.cells.dev.homeProfiles.git
        inputs.cells.dev.homeProfiles.gui
        inputs.cells.dev.homeProfiles.ctf
        inputs.cells.dev.homeProfiles.chromium
      ];

      home.packages = with inputs.nixpkgs.pkgs; [
        discord
        slack
        rustup
        python3
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
      "burp-suite"
      "ghidra"
      "google-chrome"
    ];
    homebrew.masApps = {
      "Goodnotes 6" = 1444383602;
      "Swift Playgrounds" = 1496833156;
      LINE = 539883307;
    };
  };
}
