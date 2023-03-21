{ stdenv
, lib
, fetchFromGitHub
, msbuild
, gcc
, libdrm
, libGL
, libglvnd
, libX11
, xorgproto
, libXdmcp
, xtrans
, libxcb
, libXau
}:

stdenv.mkDerivation rec {
  pname = "ultimateDoomBuilder";
  baseName = pname;
  version = "git";
}
