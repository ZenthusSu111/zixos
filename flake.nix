{
  description = "my nixos config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    
  };

  outputs = {
    nixpkgs,
    home-manager,
    nix-flatpak,
    nixos-hardware,
    ...
  } @inputs: {
    nixosConfigurations.zix = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        nixos-hardware.nixosModules.asus-rog-gl552vw
        ./laptop/device
        ./laptop/wm
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            backupFileExtension = "backup";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.zenthus = ./laptop/home;
            extraSpecialArgs = {
              inherit inputs;
            };
          };
        }
      ];
    };
  };
}
