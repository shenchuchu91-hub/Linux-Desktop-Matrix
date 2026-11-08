# NixOS Home-Manager: Hyprland 模块配置
{ config, pkgs, ... }:

{
  xdg.configFile."hypr/hyprland.conf".source = ../../../desktops/hyprland/hyprland.conf;
  xdg.configFile."hypr/hyprlock.conf".source = ../../../desktops/hyprland/hyprlock.conf;
  xdg.configFile."hypr/hypridle.conf".source = ../../../desktops/hyprland/hypridle.conf;
  xdg.configFile."waybar".source = ../../../desktops/hyprland/waybar;

  home.packages = with pkgs; [
    hyprland
    hyprlock
    hypridle
    waybar
    dunst
    satty
  ];
}
