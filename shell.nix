
let
#  pkgs = import <nixpkgs> {};
#  pkgs = import ((import <nixpkgs> {}).fetchFromGitHub {
#    owner  = "NixOS";
#    repo   = "nixpkgs-channels";
#    rev    = "2d6f84c1090ae39c58dcec8f35a3ca62a43ad38c";
#    sha256 = "0l8b51lwxlqc3h6gy59mbz8bsvgc0q6b3gf7p3ib1icvpmwqm773";
#  }) { };
  pkgs =  import (fetchGit {
    url = https://github.com/NixOS/nixpkgs-channels;
    ref = "nixpkgs-unstable";
  }) {};
in

pkgs.mkShell {
  LANG="ja_JP.UTF-8";
  LC_ALL="ja_JP.UTF-8";
  buildInputs = with pkgs;[
    glibcLocales
    emacs
    (texlive.combine {
      inherit (texlive)
        ptex-fonts
        dvipdfmx
        graphics
        collection-basic
        collection-bibtexextra
        collection-binextra
        collection-fontsextra
        collection-fontsrecommended
        collection-fontutils
        collection-formatsextra
        collection-langenglish
        collection-langeuropean
        collection-langitalian
        collection-langjapanese
        collection-latex
        collection-latexextra
        collection-latexrecommended
        collection-luatex
        collection-metapost
        collection-pictures
        collection-pstricks
        collection-publishers
        collection-xetex;
    })
  ];
  shellHook = ''
  make
  '';
}
