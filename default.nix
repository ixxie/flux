{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./fluxscript.nix {}

