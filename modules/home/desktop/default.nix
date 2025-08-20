{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./dunst.nix
    ./kitty.nix
    ./fuzzel.nix
    ./gtk.nix
    ./waybar.nix
  ];

  services = {
    network-manager-applet.enable = true;
  };

  home.packages = with pkgs; [
    libnotify
    grim
    slurp
    wl-clipboard
    pavucontrol
    pamixer
    playerctl
    wlopm
  ];
}
