{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    theme = {
      mode = {
        normal_main = {
          bg = "#282828";
          fg = "#7daea3";
        };
        normal_alt = {
          bg = "#282828";
          fg = "#7daea3";
        };
      };
    };
    settings = {
      mgr = {
        sort_dir_first = true;
        sort_by = "natural";
        sort_reverse = false;
        linemode = "none";
      };
      opener = {
        open = [
          {
            run = "xdg-open \"$@\"";
            orphan = true;
            desc = "Open";
          }
        ];
      };
    };
  };
}
