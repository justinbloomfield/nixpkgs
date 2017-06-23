{ stdenv, lib, waf, fetchFromGitHub, python }:

stdenv.mkDerivation rec {
  name = "libtermbox-${version}";
  version = "git";

  src = fetchFromGitHub {
    owner = "nsf";
    repo = "termbox";
    rev = "c736a805a6e01ed7841e3b0cc0342f3e6d0a9a6b";
    sha256 = "1xjbx2bk15cqxxbdi9dxnsw7qmjrpnbghlk173hzpjwcn4idc0vh";
  };

  buildInputs = [ python ];

  builder = ./builder.sh;
}
