{
  inputs,
  cell,
}: {
  sops = {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];

    sops.defaultSopsFile = "${inputs.self}/secrets/example.json";
    sops.age.keyFile = "/var/lib/sops-nix/key.txt";
    sops.age.generateKey = true;
    sops.secrets.hello = {};
  };
}
