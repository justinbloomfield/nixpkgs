source $stdenv/setup

buildPhase() {
    ./waf configure --prefix=$out
    ./waf
}

installPhase() {
    ./waf install 
}

genericBuild
