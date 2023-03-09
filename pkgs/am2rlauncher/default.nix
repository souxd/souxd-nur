{ stdenv
, lib
,
}:

stdenv.mkDerivation {


  meta = with lib; {
    license = licenses.gpl3;
    broken = true;
  };
}
