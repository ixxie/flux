{ pkgs, stdenv}:

let

    version = "0.0.1";

in stdenv.mkDerivation 
rec 
{

    name = "flux-${version}";

    src = ./.;

    

    phases = [ "unpackPhase" "installPhase" ];


    installPhase =
        ''
            set -x
            mkdir -p $out
            cp -R ./bin $out/bin
            cp -R ./lib $out/lib
        '';
    
}