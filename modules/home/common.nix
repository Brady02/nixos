{ pkgs, ... }:
{
  home = {
    sessionVariables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      SHELL = "zsh";
    };
    stateVersion = "25.05";
  };

  nix.gc = {
    automatic = true;
    frequency = "weekly";
    options = "--delete-older-than 7d";
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [

    # files
    ffmpegthumbnailer

    # gui apps
    vesktop
    gimp
    spotify

    # safety
    bitwarden

    # dev
    gcc
    python3
    lua
    docker
    go

    # cli
    ffmpeg-full
    ripgrep
    jq
    yq-go
    file
    which
    tree
    gnused
    gnutar
    zstd
    gnupg
    zip
    xz
    unzip
    p7zip

    # system info
    btop
    fastfetch
    gdu
    gparted
    dysk
  ];
}
