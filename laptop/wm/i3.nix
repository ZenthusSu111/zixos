{pkgs, ...}:
{
  services.displayManager.ly.enable = true;

  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      updateSessionEnvironment = true;
    };
  };
  services.libinput.enable = true;
  programs.i3lock.enable = true;
  programs.light.enable = true;

  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    fade = false;
    shadow = false;
    activeOpacity = 1.0;
    inactiveOpacity = 1.0;
    menuOpacity = 1.0;

    settings = {
      use-damage = true;
      unredir-if-possible = false;
    };
  };

  services.dunst = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
    };
  };
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    feh
    
    pavucontrol

    xclip
  ];
}
