# NixOS 系统级桌面与 Wayland 基础配置
{ config, pkgs, ... }:

{
  # 开启 Wayland 核心支持与图形栈
  programs.niri.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # 音频 PipeWire 堆栈
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # 字体配置 (CJK 与 Nerd Font)
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    sarasa-gothic
  ];

  # Fcitx5 中文输入法
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons
      fcitx5-gtk
      fcitx5-lua
    ];
  };

  # 基础 Wayland 工具链
  environment.systemPackages = with pkgs; [
    waybar
    fuzzel
    foot
    kitty
    satty
    wl-clipboard
    cliphist
    brightnessctl
    pavucontrol
  ];
}
