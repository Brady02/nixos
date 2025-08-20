{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = {nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      lyle = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86-64-linux";
        modules = [
          ./hosts/lyle
          ./modules
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.bradyw = import ./modules/home;
              extraSpecialArgs = {inherit inputs;};
            };
          }
        ];
      };
    };
  };
}
