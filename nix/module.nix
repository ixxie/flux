{ config, pkgs, ... }:


let

    flux = (import ./. {});

in
{

    config =
    {
        environment.systemPackages = [ flux ];
    };
    
}