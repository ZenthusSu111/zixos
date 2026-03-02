{pkgs, ...}:
{
  imports = [
    ./applications
    ./devtools
    ./config
  ];

  home.username = "zenthus";
  home.homeDirectory = "/home/zenthus";

  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.pointerCursor = {
    enable = true;
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = false;
    desktop = null;
    documents = null;
    music = null;
    pictures = null;
    publicShare = null;
    templates = null;
    videos = null;
  };
}
