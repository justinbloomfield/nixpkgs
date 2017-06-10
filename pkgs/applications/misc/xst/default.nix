{ stdenv, fetchFromGitHub, writeText, pkgconfig, libX11, ncurses, libXext, libXft
, fontconfig, conf ? null, extraLibs ? [], patches ? []}:

with stdenv.lib;

let patches' = if isNull patches then [] else patches;
in stdenv. mkDerivation rec {
  name="xst-git";

  src = fetchFromGitHub {
    owner = "neeasade";
    repo = "xst";
    rev = "ead063aeb5b94df7d71ffee60f8f9445327a80c8";
    sha256 = "1fh4y2w0icaij99kihl3w8j5d5b38d72afp17c81pi57f43ss6pc";
  };
  configFile = optionalString (conf!=null) (writeText "config.h" conf);
  preBuild = optionalString (conf!=null) "cp ${configFile} ./src/config.h";

  
  buildInputs = [ pkgconfig libX11 ncurses libXext libXft fontconfig ] ;

  installPhase = "
    TERMINFO=$out/share/terminfo make install PREFIX=$out
  ";

  meta = {
    homepage = https://github.com/neeasade/xst;
    license = stdenv.lib.licenses.mit;
  };
}
