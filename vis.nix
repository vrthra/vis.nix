with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "vis-1.0";
  
  src = fetchurl {
    url = https://github.com/martanne/vis/archive/7df8140a9ba4f0fbc2c55fa2de5eb789d878d4a0.zip;
    sha256 = "1w4sq9mc4kflvc2ys93lsnz1bd3irbr2kp6sfq4f542va0s83vc7";
  };
  
  buildInputs = [ pkgconfig perl glib zip unzip ncurses libtermkey];

  meta = {
    description = "The vim like editor";
    homepage = http://github.com/martanne/vis;
    license = "GPLv2+";
    maintainers = [ ];
  };
}
