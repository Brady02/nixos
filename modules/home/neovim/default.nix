{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
  };

  #xdg.configFile = {
    #"nvim/init.lua".source = ./config/init.lua;
    #"nvim/lua".source = ./config/lua;
  #};

  # ls, fmt, linters
  home.packages = with pkgs; [
    cargo
    gopls
    clang-tools
    typescript-language-server
    pyright
    nixd
    nil
    deadnix
    nixfmt-rfc-style
    lua-language-server
    stylua
    markdownlint-cli
  ];
}
