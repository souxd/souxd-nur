{ stdenv
, lib
,
}:

stdenv.mkDerivation {


  meta = with lib; {
    broken = true;
  };
}
