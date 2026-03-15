{
  pkgs,
  username,
  ...
}: {
  networking.hostName = "zix";
  users.users.${username} = {
    shell = pkgs.nushell;
    isNormalUser = true;
    description = "IanSu";
    extraGroups = ["networkmanager" "wheel" "video"];
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.11";
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      substituters = [
        "http://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}
