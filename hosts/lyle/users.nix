{pkgs, ... }:
{
  users = {
    users.bradyw = {
      isNormalUser = true;
      description = "bradyw";
      home = "/home/bradyw";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
      ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
    };
  };
  services.getty = {
    autologinUser = "bradyw";
    helpLine = "";
  };
}
