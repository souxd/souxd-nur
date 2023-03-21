{ pkgs ? import <nixpkgs> { } }:

{
  beebeep = pkgs.qt5.callPackage ./pkgs/beebeep { };
  am2rlauncher = pkgs.callPackage ./pkgs/am2rlauncher { };
  spiralknights = pkgs.callPackage ./pkgs/spiralknights { };
  avisynthplus = pkgs.callPackage ./pkgs/avisynthplus { };
  flashplayer-standalone = pkgs.callPackage ./pkgs/flashplayer-standalone { };
  ultimateDoomBuilder = pkgs.callPackage ./pkgs/ultimateDoomBuilder { };
}
