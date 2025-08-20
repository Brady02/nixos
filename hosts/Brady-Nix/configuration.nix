# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{  pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];
    
  #home manager setup
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.bradyw = {pkgs}: {
      programs.home-manager-enable = true;
      xdg.enable = true;
      xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [xdg-desktop-portal-hyprland xdg-desktop-portal-gtk];
        xdgOpenUsePortal = true;
      };
      home = {
        username = "bradyw";
        homeDirectory = "/home/bradyw";
        stateVersion = "25.05";
        sessionVariables = {
          EDITOR = "nvim";
          BROWSER = "firefox";
          TERMINAL = "kitty";
        };
        packages = with pkgs; [
          git
          unzip
          ripgrep
        ];
      };
    };
  };

  programs.dconf.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enabling Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Hostname Def.
  networking.hostName = "Brady-Nix"; # Define your hostname.
  
  # Enable networking
  networking.networkmanager.enable = true;

  # Enabler Bluetooth
  hardware.bluetooth.enable = true;

  # Filesystems support
  boot.supportedFilesystems = ["ntfs" "exfat" "ext4" "fat32" "btrfs"];
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisk2.enable = true;
  # Set your time zone.
  time.timeZone = "America/Halifax";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bradyw = {
    isNormalUser = true;
    description = "brady warren";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Activate pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  security = {
    polkit.enable = true;
  };

  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    neovim
    kitty
    firefox
    git
    clang
    dunst
    waybar
    libnotify
    swww
    rofi-wayland
    hyprls
    nil
    cargo
    go
    gopls
    lua
    lua-language-server
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
