#!/usr/bin/env bash
# ==============================================================================
#  🌸 GNOME 4x/5x 现代化工作流快速配置脚本 (gnome-setup.sh)
#  项目: Linux-Desktop-Matrix
#  维护: shenchuchu91-hub
# ==============================================================================

set -e

echo "[*] 正在应用 GNOME 桌面环境调优参数..."

# 1. 颜色模式与美学外观 (优先暗色主题与动态壁纸支持)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-show-seconds false

# 2. 窗口管理与平铺边缘吸附
gsettings set org.gnome.mutter edge-tiling true
gsettings set org.gnome.mutter dynamic-workspaces true
gsettings set org.gnome.mutter workspaces-only-on-primary false
gsettings set org.gnome.mutter center-new-windows true

# 3. 触控板与鼠标偏好 (自然滚动与轻触点击)
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true

# 4. 高效快捷键绑定 (对齐平铺窗口管理器习惯)
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q', '<Alt>F4']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"

echo "[✓] GNOME 核心工作流与快捷键配置已成功应用！"
