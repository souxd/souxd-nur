{ pkgs ? import <nixpkgs> { } }:

{
  beebeep = pkgs.qt5.callPackage ./pkgs/beebeep { };
  glaxnimate = pkgs.qt5.callPackage ./pkgs/glaxnimate { };
  am2rlauncher = pkgs.callPackage ./pkgs/am2rlauncher { };
  spiralknights = pkgs.callPackage ./pkgs/spiralknights { };
  zandronum-beta = pkgs.callPackage ./pkgs/zandronum-beta { };
  avisynthplus = pkgs.callPackage ./pkgs/avisynthplus { };
  flashplayer-standalone = pkgs.callPackage ./pkgs/flashplayer-standalone { };
}
