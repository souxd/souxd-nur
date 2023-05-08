{ stdenv
, lib
,
}:

stdenv.mkDerivation {
  pname = "am2rlauncher";


  meta = with lib; {
    license = licenses.gpl3;
    broken = true;
  };
}
