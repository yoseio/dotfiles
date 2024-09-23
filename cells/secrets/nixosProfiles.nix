{
  inputs,
  cell,
}: {
  sops = {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];

    sops.defaultSopsFile = "${inputs.self}/secrets/default.yaml";
    sops.age.keyFile = "/var/lib/sops-nix/key.txt";
    sops.age.generateKey = true;

    sops.secrets."users/root".neededForUsers = true;
    sops.secrets."users/yoseio".neededForUsers = true;
  };
}
