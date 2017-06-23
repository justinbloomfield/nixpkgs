{ stdenv, fetchgit, libtermbox }:

stdenv.mkDerivation rec {
  name = "sex";
  version = "git";

  src = fetchgit {
    url = "git://z3bra.org/sex";
    rev = "0be9b43d16db039c11d2b28652a064039b192675";
    sha256 = "10ixjvcgydfqygfl3a8zzs04f55bi7yrh81wsbxfwwy0x9pd8sv7";
  };

  buildInputs = [ libtermbox ]

  makeFlags = ''
  PREFIX=$out
  '';
}
