{
  programs.imv = {
    enable = true;
    settings = {
      binds = {
        y = "exex wl-copy < \"$imv_current_file\"";
      };
    };
  };
}
