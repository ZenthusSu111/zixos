{pkgs, ...}:
{
  home.packages = with pkgs; [
    rofi
    nerd-fonts.iosevka
  ];
}
