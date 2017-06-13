{ stdenv, fetchgit,  ncurses }:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "sandy-${version}";
  version = "0.4";

  src = fetchgit {
    url = "http://git.suckless.org/sandy";
    rev = "e73326c64a792cd4582a3833c3537be4906fe52a";
    sha256 = "0kws1kpil69w81n8ccxpnzbv2jjlda0ns40mc3yg6f9s8cyj4z4n";
    fetchSubmodules = true;
  };

  buildInputs = [ ncurses ];

  patches = [ ./status.patch ];
  
  installPhase = ''
    make install PREFIX=$out
  '';
}
