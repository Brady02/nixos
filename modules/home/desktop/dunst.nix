{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = "300";
        origin = "bottom-right";
        offset = "(30, 30)";
        alignment = "center";
        icon_corner_radius = 5;
        icon_position = "right";
        corner_radius = 5;
        frame_width = 2;
        gap_size = 2;
        font = "firacode Nerd Font 9";
        format = "<b>%s</b>\n%b";
        enable_recursive_icon_lookup = true;
        min_icon_size = 32;
        max_icon_size = 64;
      };

      urgency_low = {
        background = "#282828";
        foreground = "#ddc7a1";
        frame_color = "#a9b665";
      };

      urgency_normal = {
        background = "#282828";
        foreground = "#ddc7a1";
        frame_color = "#d8a657";
      };

      urgency_critical = {
        background = "#282828";
        foreground = "#ddc7a1";
        frame_color = "#ea6962";
      };
    };
  };
}
