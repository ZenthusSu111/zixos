{config, ...}:
  let
    configPath = "${config.home.homeDirectory}/zixos/laptop/home/config";
  in {
    xdg.configFile."i3".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/i3";
    xdg.configFile."rofi".source = config.lib.file.mkOutOfStoreSymlink "${configPath}/rofi";
  }
