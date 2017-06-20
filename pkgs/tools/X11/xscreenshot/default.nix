{ stdenv, fetchgit, libX11 }:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "xscreenshot";
  version = "git";

  src = fetchgit {
    url = "git://git.2f30.org/xscreenshot";
    rev = "6b5515432737f1a4c93c8691829f0a17b8f42a5d";
    sha256 = "1056s4rwknx2jcbgakij3749hk4mbv6ms4acfkj8s5x51nfg1xzy";
    fetchSubmodules = true;
  };

  buildInputs = [ libX11 ];

  installPhase = ''
    make install PREFIX=$out
  '';
}
