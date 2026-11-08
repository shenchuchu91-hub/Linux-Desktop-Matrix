{
  description = "Linux-Desktop-Matrix - NixOS Flake & Home-Manager Rice Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    # 模块导出：支持直接在系统的 configuration.nix 中作为 module 引入
    nixosModules.desktopMatrix = import ./default.nix;

    # Home-Manager 独立模块导出
    homeManagerModules = {
      niri = import ./home-manager/niri.nix;
      hyprland = import ./home-manager/hyprland.nix;
      gnome = import ./home-manager/gnome.nix;
    };
  };
}
