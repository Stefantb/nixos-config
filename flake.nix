{
    description = "My first flake!";

    inputs = {
        # nixpkgs = {
        #     url = "github:Nixos/nixpkgs/nixos-24.05";  #special path and we can ommit "github:Nixos/"
        # };
        nixpkgs.url = "github:Nixos/nixpkgs/nixos-24.05"; # another way to write this!
    };

    outputs = { self, nixpkgs, ...}:
    let
    lib = nixpkgs.lib;
    in {
        nixosConfigurations = {
            nixos = lib.nixosSystem {       # nixos is the confing name and usually matches the hostname.
                                            # Otherwise the config name must be explicit: sudo nixos-rebuild switch --flake .#nixos
                system = "x86_64-linux";
                modules = [ ./configuration.nix ];
            };
        };
    };
}

