with import <nixpkgs> {};                                                                                                                                                                                                                       

stdenv.mkDerivation {
  name = "vis-1.0";

  src = fetchurl {
    url = https://github.com/martanne/vis/archive/7df8140a9ba4f0fbc2c55fa2de5eb789d878d4a0.zip;
    sha256 = "1w4sq9mc4kflvc2ys93lsnz1bd3irbr2kp6sfq4f542va0s83vc7";
  };  

  nativeBuildInputs = [ makeWrapper ];

  buildInputs = [ pkgconfig unzip ncurses libtermkey lua lua52Packages.lpeg ];

  LUA_CPATH="${lua52Packages.lpeg}/lib/lua/${lua.luaversion}/?.so;";
  LUA_PATH="${lua52Packages.lpeg}/share/lua/${lua.luaversion}/?.lua";

  postInstall = ''
    echo wrapping $out/bin/vis with runtime environment
    wrapProgram $out/bin/vis \
      --prefix LUA_CPATH : "${lua52Packages.lpeg}/lib/lua/${lua.luaversion}/?.so" \
      --prefix LUA_PATH : "${lua52Packages.lpeg}/share/lua/${lua.luaversion}/?.lua" \
      --prefix VIS_PATH : "$out/share/vis"
  ''; 

  meta = { 
    description = "A vim like editor";
    homepage = http://github.com/martanne/vis;
    license = "";
    maintainers = [ ];
  };  
}
