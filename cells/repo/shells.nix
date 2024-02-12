{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs std;
  l = nixpkgs.lib // builtins;
in
  l.mapAttrs (_: std.lib.dev.mkShell) {
    default = {...}: {
      name = "yoseio/dotfiles";
      imports = [std.std.devshellProfiles.default];
      commands = [
        {
          package = nixpkgs.alejandra;
          # category = "dev";
        }
      ];
    };
  }
