{pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  security = {
    sudo.execWheelOnly = true;
    polkit.enable = true;
  };

  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than-15d";
    };
    settings.experimental-features = [
    "nix-command" 
    "flakes"
    ];
  };

  system.stateVersion = "25.05";

  environment = {
    shells = [pkgs.bashInteractive];
    systemPackages = with pkgs; [
      wget
      curl
      git
      usbutils
    ];
    variables.EDITOR = "neovim";
  };
}
