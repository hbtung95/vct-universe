{
  description = "VCT Platform Bleeding Edge 2026 Environment";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        buildInputs = with pkgs; [ 
            nodejs_23 go_1_23 python313 pnpm docker-compose postgresql_17 bun 
        ];
        shellHook = "echo '--- VCT PLATFORM 2026: SYSTEM ARMED AND READY ---'";
      };
    };
}
