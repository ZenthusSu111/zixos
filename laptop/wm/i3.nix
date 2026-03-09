{pkgs, ...}:
{
  boot = {
    plymouth = {
      enable = true;
      theme = "catppuccin-mocha";
      themePackages = [(pkgs.catppuccin-plymouth.override {variant = "mocha";})];
    };
  };

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

  services.dbus = {
    enable = true;
    packages = [ pkgs.dconf ];
  };

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
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-gnome ];
    config = {
      common = {
        default = [
          "gtk"
          "gnome"
        ];
      };
      i3 = {
        default = [ "gtk" "gnome" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };
    };
  };

  environment.sessionVariables = {
    # 指定輸入法框架
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    # kitty
    GLFW_IM_MODULE = "ibus";
  };
  environment.systemPackages = with pkgs; [
     gnome-keyring

    adwaita-icon-theme
    feh
    
    pavucontrol

    xclip
  ];
}
