{pkgs, ...}:
{
  ### emacs daemon
  services.emacs = {
    enable = true;
    defaultEditor = true;
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk;
    extraPackages = epkgs: with epkgs; [
      vterm
      treesit-grammars.with-all-grammars
      treesit-auto
    ];
    extraConfig = builtins.readFile ./init.el;
  };
}
