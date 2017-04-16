{ pkgs, stdenv}:

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