{ stdenv
, lib
, fetchurl
, alsaLib
, atk
, bzip2
, cairo
, curl
, expat
, fontconfig
, freetype
, gdk-pixbuf
, glib
, glibc
, graphite2
, gtk2
, harfbuzz
, libICE
, libSM
, libX11
, libXau
, libXcomposite
, libXcursor
, libXdamage
, libXdmcp
, libXext
, libXfixes
, libXi
, libXinerama
, libXrandr
, libXrender
, libXt
, libXxf86vm
, libdrm
, libffi
, libglvnd
, libpng
, libvdpau
, libxcb
, libxshmfence
, nspr
, nss
, pango
, pcre
, pixman
, zlib
, unzip
, debug ? false
}:

stdenv.mkDerivation rec {
  name = "flashplayer-standalone-${version}";
  version = "32.0.0.171";

  src = fetchurl {
    url =
      if debug then
        "https://archive.org/download/flashplayerarchive/pub/flashplayer/installers/archive/fp_32.0.0.371_archive.zip/32_0_r0_371_debug%2Fflashplayer32_0r0_371_linux_sa_debug.x86_64.tar.gz"
      else
        "https://archive.org/download/flashplayerarchive/pub/flashplayer/installers/archive/fp_32.0.0.371_archive.zip/32_0_r0_371%2Fflashplayer32_0r0_371_linux_sa.x86_64.tar.gz";
    sha256 =
      if debug then
        "0n3bk2y1djaqrdygnr81n8lsnj2k60kaziffl41zpdvzi1jc7wgn"
      else
        "18ll9rnfhbnz54q4d7q9fb13lix4i62zr6z6n574qvwngrvbrr8a";
  };

  nativeBuildInputs = [ unzip ];
  sourceRoot = ".";
  dontStrip = true;
  dontPatchELF = true;
  preferLocalBuild = true;
  installPhase = ''
    mkdir -p $out/bin
    cp -pv flashplayer${lib.optionalString debug "debugger"} $out/bin
    patchelf \
      --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
      --set-rpath "$rpath" \
      $out/bin/flashplayer${lib.optionalString debug "debugger"}
  '';
  rpath = lib.makeLibraryPath
    [ stdenv.cc.cc
      alsaLib atk bzip2 cairo curl expat fontconfig freetype gdk-pixbuf glib
      glibc graphite2 gtk2 harfbuzz libICE libSM libX11 libXau libXcomposite
      libXcursor libXdamage libXdmcp libXext libXfixes libXi libXinerama
      libXrandr libXrender libXt libXxf86vm libdrm libffi libglvnd libpng
      libvdpau libxcb libxshmfence nspr nss pango pcre pixman zlib
    ];
  meta = with lib; {
    description = "Adobe Flash Player standalone executable from archive.org";
    homepage = https://archive.org/details/flashplayerarchive;
    license = licenses.unfree;
    maintainers = [];
    platforms = [ "x86_64-linux" ];
    # Application crashed with an unhandled SIGSEGV
    # Not on all systems, though. Video driver problem?
    broken = false;
  };
}
