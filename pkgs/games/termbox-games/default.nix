{ stdenv, fetchFromGitHub, libtermbox }:

stdenv.mkDerivation rec {
  name = "termbox-games";
  version = "git";

  src = fetchFromGitHub {
    owner = "stillmotion";
    repo = "terminal-games";
    rev = "dee5a3b06b8e160d389bbd9e833cc83c967e6a43";
    sha256 = "07cshqnnc75ihfyjki0m9nxlql23brsfj8g8a2vkf5bq0vc50hwv";
  };
  
  buildInputs = [ libtermbox ];

  makeFlags = ''
    PREFIX=$out
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp * $out/bin
  '';
}
