with import <nixpkgs> {};                                                                                                                                                                                                                       

stdenv.mkDerivation {
  name = "vis-1.0";

  src = fetchurl {
    url = https://github.com/martanne/vis/archive/472c559a273d3c7b0f5ee92260c5544bc3d74576.zip;
    sha256 = "4283475d89a73642a2dcaab17cc24760d4ff70f31cb6f94e5d6bf3e2efcd851f";
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
