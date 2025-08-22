{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "firacode Nerd Font:size=12";
        icon-theme = "Papirus";
        width = 60;
        lines = 8;
        line-height = 30;
        horizontal-pad = 20;
        terminal = "kitty -e";
        dpi-aware = "no";
      };
      colors = {
        background = "282828ff";
        text = "7c6f63ff";
        match = "ddc7a1ff";
        selection = "32302fff";
        selection-match = "a9b665ff";
        selection-text = "d8a657ff";
        border = "e78a4eff";
      };
      border = {
        width = 2;
      };
    };
  };
}
