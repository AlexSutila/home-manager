{
  description = "Home Manager configuration of dorce";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plugin-transfer.url = "github:coffebar/transfer.nvim";
    plugin-transfer.flake = false;

    plugin-table-mode.url = "github:Kicamon/markdown-table-mode.nvim";
    plugin-table-mode.flake = false;

    nix-colors.url = "github:misterio77/nix-colors";
    nixgl.url   = "github:nix-community/nixGL";
  };

  outputs = { nixgl, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."dorce-home" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit inputs;
          nixgl = nixgl;
        };
      };
    };
}
