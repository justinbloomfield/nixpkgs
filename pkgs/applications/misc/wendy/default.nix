 {stdenv, fetchgit }:

 with stdenv.lib;

 stdenv.mkDerivation rec {
   name = "wendy-${version}";
   version = "git";

   src = fetchgit {
     url = "git://z3bra.org/wendy";
     rev = "e0d77986af818120da2174f5bb7a1e2688773592";
     sha256 = "0w6fvaikxddhcs3zv3l8r32dgsqyklswzsvjw674mcr55ahhx2f2";
     fetchSubmodules = true;
   };

   installPhase = ''
     make install PREFIX=$out
   '';
 }
