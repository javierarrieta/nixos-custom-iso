{
  description = "Custom NixOS Installer ISO";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      # This name "my-iso" is what you'll use to build it
      nixos-custom-iso = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Standard NixOS installer module
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ./iso-config.nix
        ];
      };
    };
  };
}