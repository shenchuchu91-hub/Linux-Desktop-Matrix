# NixOS Home-Manager: GNOME 偏好与快捷键声明
{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      show-battery-percentage = true;
    };
    "org/gnome/mutter" = {
      edge-tiling = true;
      dynamic-workspaces = true;
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" "<Alt>F4" ];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
    };
  };
}
