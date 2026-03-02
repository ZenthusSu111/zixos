{pkgs, ...}:
{
  home.packages = with pkgs; [
    rofi
    kitty
    nerd-fonts.iosevka
  ];
}
