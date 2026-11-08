# NixOS Home-Manager: Niri 模块链接配置
{ config, pkgs, ... }:

{
  # 导入 Niri 配置文件 (指向仓库内 desktops/niri-shorin 或 niri-vanilla)
  xdg.configFile."niri".source = ../../../desktops/niri-shorin;

  # 用户级依赖
  home.packages = with pkgs; [
    fuzzel
    mako
    waybar
    satty
    wl-clipboard
  ];
}
