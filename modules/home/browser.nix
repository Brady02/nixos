{ pkgs, ...}:
{
  programs = {
    firefox = {
      enable = true;
      policies = {
        DownloadDirectory = "\${home}/downloads";
        OfferToSaveLogins = false;
        DisableTelemetry = true;
      };
    };
  };
  home.packages = with pkgs; [ ungoogled-chromium ];
}
