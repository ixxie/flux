{ pkgs, stdenv}:

# flux
#   bin/
#      flux.sh
#   lib/
#      subcom1
#      subcom2
#      ...
#   flux.nix
#   default.nix

let

    version = "0.0.1";


in stdenv.mkDerivation 
{

    name = "flux-${version}";

    src = ./.;

    phases = [ "installPhase" ];


    installPhase =
        ''
            mkdir -p $out/
            cp -R ./bin $out/.
            cp -R ./lib $out/.
        '';
    
}