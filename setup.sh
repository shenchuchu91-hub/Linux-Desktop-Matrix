#!/usr/bin/env bash
# ==============================================================================
#  🌸 Linux-Desktop-Matrix: 跨发行版 Linux 桌面管理与平铺架构交互式选择器
#  项目: Linux-Desktop-Matrix
#  维护: shenchuchu91-hub
#  协议: MIT License
# ==============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP="$(date +'%Y%m%d_%H%M%S')"

# 终端色彩定义
C_RESET="\033[0m"
C_BOLD="\033[1m"
C_RED="\033[38;2;243;139;168m"
C_GREEN="\033[38;2;166;227;161m"
C_YELLOW="\033[38;2;249;226;175m"
C_BLUE="\033[38;2;137;180;250m"
C_MAGENTA="\033[38;2;203;166;247m"
C_CYAN="\033[38;2;137;220;235m"
C_GRAY="\033[38;2;108;112;134m"

print_banner() {
    clear 2>/dev/null || true
    echo -e "${C_BLUE}"
    cat << 'EOF'
       /\_/\   🌸 Linux-Desktop-Matrix 🌸
      ( o.o )  跨发行版 Linux 桌面环境与平铺架构全景矩阵
       > ^ <   Author: shenchuchu91-hub · Rigorous & Verifiable
EOF
    echo -e "${C_RESET}"
    echo -e "${C_GRAY}======================================================================${C_RESET}"
}

# 1. 自动检测 Linux 发行版
detect_distro() {
    DETECTED="generic"
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            arch|nyarch|endeavouros|manjaro)
                DETECTED="arch"
                DISTRO_NAME="Arch Linux / Nyarch / Arch-based ($PRETTY_NAME)"
                ;;
            nixos)
                DETECTED="nixos"
                DISTRO_NAME="NixOS ($PRETTY_NAME)"
                ;;
            fedora|nobara)
                DETECTED="fedora"
                DISTRO_NAME="Fedora / RHEL ($PRETTY_NAME)"
                ;;
            ubuntu|debian|linuxmint|pop)
                DETECTED="debian-ubuntu"
                DISTRO_NAME="Debian / Ubuntu ($PRETTY_NAME)"
                ;;
            opensuse*|suse)
                DETECTED="opensuse"
                DISTRO_NAME="openSUSE ($PRETTY_NAME)"
                ;;
            *)
                DETECTED="generic"
                DISTRO_NAME="通用 Linux 发行版 ($PRETTY_NAME)"
                ;;
        esac
    else
        DISTRO_NAME="未知 Linux 系统"
    fi
}

# 2. 发行版确认与手动覆盖
select_distro() {
    echo -e "${C_CYAN}[*] 系统环境探测:${C_RESET}"
    echo -e "    当前自动识别为: ${C_GREEN}${C_BOLD}${DISTRO_NAME}${C_RESET}\n"
    
    echo -e "请确认目标发行版："
    echo -e "  [Enter] 直接确认使用识别出的发行版"
    echo -e "  [1] Arch Linux / Nyarch"
    echo -e "  [2] NixOS"
    echo -e "  [3] Fedora"
    echo -e "  [4] Debian / Ubuntu"
    echo -e "  [5] openSUSE"
    echo -e "  [6] 其他通用发行版"
    read -p "请输入选项 [默认回车直接确认]: " DISTRO_CHOICE

    case "$DISTRO_CHOICE" in
        1) TARGET_DISTRO="arch";;
        2) TARGET_DISTRO="nixos";;
        3) TARGET_DISTRO="fedora";;
        4) TARGET_DISTRO="debian-ubuntu";;
        5) TARGET_DISTRO="opensuse";;
        6) TARGET_DISTRO="generic";;
        "") TARGET_DISTRO="$DETECTED";;
        *) 
            echo -e "${C_YELLOW}[!] 输入无效，已默认采用自动识别的发行版: ${DETECTED}${C_RESET}"
            TARGET_DISTRO="$DETECTED"
            ;;
    esac
    echo -e "${C_GREEN}[✓] 已选定目标发行版架构: ${TARGET_DISTRO}${C_RESET}\n"
}

# 3. 桌面环境与窗口管理器交互式选择
select_desktop() {
    echo -e "${C_GRAY}======================================================================${C_RESET}"
    echo -e "${C_BOLD}${C_MAGENTA}请明确选择您想要部署的桌面环境 / 窗口管理器：${C_RESET}"
    echo -e "${C_GRAY}======================================================================${C_RESET}"
    echo -e "  ${C_CYAN}[1] Niri - Shorin (大老师) 深度定制版 (推荐)${C_RESET}"
    echo -e "      ${C_GRAY}▸ 特性: 独家包含大老师优化版 shorin-windowrules.kdl 智能规则、${C_RESET}"
    echo -e "      ${C_GRAY}        卷轴平铺流体动画、Kawase 高斯模糊与 DMS 外壳联动。${C_RESET}"
    echo -e "      ${C_GRAY}▸ 适用: 追求极致开箱即用二次元美学与卷轴操作体验。${C_RESET}\n"

    echo -e "  ${C_CYAN}[2] Niri - 官方纯净原版 (Vanilla Upstream)${C_RESET}"
    echo -e "      ${C_GRAY}▸ 特性: 采用官方上游纯净 default-config.kdl 标准，零多余外部脚本，${C_RESET}"
    echo -e "      ${C_GRAY}        保留最原汁原味的上游默认架构与键位。${C_RESET}"
    echo -e "      ${C_GRAY}▸ 适用: 开发者、极简主义者或计划从零定制 KDL 的用户。${C_RESET}\n"

    echo -e "  ${C_CYAN}[3] DMS (Dank Miau Shell)${C_RESET}"
    echo -e "      ${C_GRAY}▸ 特性: 现代化 Wayland 二次元桌面面板、侧边控制中心与配套 Firefox CSS。${C_RESET}"
    echo -e "      ${C_GRAY}▸ 适用: 需要独立增强桌面外壳与托盘控制。${C_RESET}\n"

    echo -e "  ${C_CYAN}[4] Hyprland - 现代化流体平铺全套方案${C_RESET}"
    echo -e "      ${C_GRAY}▸ 特性: 动态瓦片平铺、Catppuccin Sakura 渐变边框、双重 Kawase 模糊、${C_RESET}"
    echo -e "      ${C_GRAY}        Hyprlock 锁屏、Hypridle 守护及专属 Waybar 顶栏。${C_RESET}"
    echo -e "      ${C_GRAY}▸ 适用: 偏好动态瓦片平铺与高刷新率视觉特效。${C_RESET}\n"

    echo -e "  ${C_CYAN}[5] GNOME - 现代工作站工作流优化${C_RESET}"
    echo -e "      ${C_GRAY}▸ 特性: 沉浸式暗色模式、触控板手势、平铺边缘吸附、快捷键映射与精选扩展清单。${C_RESET}"
    echo -e "      ${C_GRAY}▸ 适用: 追求极致稳固与开箱即用的完整桌面生态。${C_RESET}\n"

    echo -e "  ${C_CYAN}[6] 生产力终端运行时 (Common Shell Suite)${C_RESET}"
    echo -e "      ${C_GRAY}▸ 特性: Fish 4.x + Starship + Foot / Kitty + Yazi 文件管理器。${C_RESET}"
    echo -e "      ${C_GRAY}▸ 适用: 为任何桌面提供跨平台的统一终端开发环境。${C_RESET}\n"

    echo -e "  ${C_CYAN}[7] 全部拉取并检出 (Full Matrix Checkout)${C_RESET}"
    echo -e "      ${C_GRAY}▸ 特性: 完整下载所有桌面配置至当前目录，不改动 ~/.config 系统配置。${C_RESET}\n"

    echo -e "  ${C_RED}[0] 退出安装 (Exit)${C_RESET}"
    echo -e "${C_GRAY}======================================================================${C_RESET}"

    read -p "请输入您要选择的编号 [0-7]: " WM_CHOICE
}

# 4. 执行计划确认 (Pre-Flight Confirmation)
confirm_and_deploy() {
    SRC_DIR=""
    DEST_DIR=""
    NAME=""

    case "$WM_CHOICE" in
        1)
            SRC_DIR="$SCRIPT_DIR/desktops/niri-shorin"
            DEST_DIR="$HOME/.config/niri"
            NAME="Niri - Shorin (大老师) 深度定制版"
            ;;
        2)
            SRC_DIR="$SCRIPT_DIR/desktops/niri-vanilla"
            DEST_DIR="$HOME/.config/niri"
            NAME="Niri - 官方纯净原版 (Vanilla Upstream)"
            ;;
        3)
            SRC_DIR="$SCRIPT_DIR/desktops/dms"
            DEST_DIR="$HOME/.config/dms"
            NAME="DMS (Dank Miau Shell)"
            ;;
        4)
            SRC_DIR="$SCRIPT_DIR/desktops/hyprland"
            DEST_DIR="$HOME/.config/hypr"
            NAME="Hyprland 现代流体平铺全套方案"
            ;;
        5)
            NAME="GNOME 现代工作流优化"
            ;;
        6)
            SRC_DIR="$SCRIPT_DIR/desktops/common-shell"
            NAME="生产力终端运行时 (Fish + Starship + Foot/Kitty + Yazi)"
            ;;
        7)
            echo -e "\n${C_GREEN}[✓] 全部配置已就绪于当前仓库目录：${SCRIPT_DIR}/desktops/${C_RESET}"
            echo -e "您可随时按需手动查看、复制或软链接所需模块。"
            exit 0
            ;;
        0)
            echo -e "\n${C_YELLOW}[*] 安装已取消，未改动任何系统文件。${C_RESET}"
            exit 0
            ;;
        *)
            echo -e "\n${C_RED}[!] 无效的选项编号，操作已终止。${C_RESET}"
            exit 1
            ;;
    esac

    # NixOS 专属处理提示
    if [ "$TARGET_DISTRO" = "nixos" ]; then
        echo -e "\n${C_MAGENTA}❄️  NixOS 架构专属建议:${C_RESET}"
        echo -e "您正在针对 NixOS 部署配置。在 NixOS 体系下，有两种标准实践："
        echo -e "  方案 A (推荐)：使用 Home-Manager 声明式管理。"
        echo -e "          本仓库已为您准备了现成的 Nix 模块：${C_CYAN}distros/nixos/home-manager/${C_RESET}"
        echo -e "  方案 B：使用传统 ~/.config 符号链接 (由脚本自动创建)。"
        echo -e "--------------------------------------------------"
        read -p "是否继续执行传统 ~/.config 符号链接？(y/N): " NIX_CONFIRM
        if [[ ! "$NIX_CONFIRM" =~ ^[Yy]$ ]]; then
            echo -e "\n${C_BLUE}[*] 请查阅 distros/nixos/flake.nix 与 distros/nixos/home-manager/ 了解声明式配置方法。${C_RESET}"
            exit 0
        fi
    fi

    # GNOME 专项执行
    if [ "$WM_CHOICE" = "5" ]; then
        echo -e "\n${C_CYAN}----------------------------------------------------------------------${C_RESET}"
        echo -e "${C_BOLD}【GNOME 优化执行计划】${C_RESET}"
        echo -e "  - 操作内容: 应用暗色主题、边缘平铺、平铺快捷键映射"
        echo -e "  - 执行脚本: ${SCRIPT_DIR}/desktops/gnome/gnome-setup.sh"
        echo -e "  - 扩展指引: ${SCRIPT_DIR}/desktops/gnome/extensions.txt"
        echo -e "${C_CYAN}----------------------------------------------------------------------${C_RESET}"
        read -p "确认立即应用 GNOME 调优参数？[y/N]: " GNOME_CONFIRM
        if [[ "$GNOME_CONFIRM" =~ ^[Yy]$ ]]; then
            bash "$SCRIPT_DIR/desktops/gnome/gnome-setup.sh"
            echo -e "\n${C_GREEN}[✓] GNOME 调优应用成功！${C_RESET}"
        else
            echo -e "\n${C_YELLOW}[*] 已跳过应用。${C_RESET}"
        fi
        exit 0
    fi

    # 通用终端配置专项
    if [ "$WM_CHOICE" = "6" ]; then
        echo -e "\n${C_CYAN}----------------------------------------------------------------------${C_RESET}"
        echo -e "${C_BOLD}【终端运行时执行计划】${C_RESET}"
        echo -e "  - 涉及模块: fish, starship.toml, foot, kitty, yazi, fuzzel"
        echo -e "  - 目标目录: ~/.config/{fish, foot, kitty, yazi, fuzzel} 及 starship.toml"
        echo -e "  - 自动备份: 若目标存在，将重命名备份至带有 .backup.${TIMESTAMP} 的路径"
        echo -e "${C_CYAN}----------------------------------------------------------------------${C_RESET}"
        read -p "确认执行终端组件部署？[y/N]: " SHELL_CONFIRM
        if [[ "$SHELL_CONFIRM" =~ ^[Yy]$ ]]; then
            mkdir -p "$HOME/.config"
            for item in fish foot kitty yazi fuzzel; do
                if [ -d "$SRC_DIR/$item" ]; then
                    if [ -e "$HOME/.config/$item" ]; then
                        mv "$HOME/.config/$item" "$HOME/.config/${item}.backup.${TIMESTAMP}"
                        echo -e "${C_GRAY}[备份] 已将原 ~/.config/$item 备份为 ~/.config/${item}.backup.${TIMESTAMP}${C_RESET}"
                    fi
                    ln -sf "$SRC_DIR/$item" "$HOME/.config/$item"
                    echo -e "${C_GREEN}[链接] ~/.config/$item -> $SRC_DIR/$item${C_RESET}"
                fi
            done
            if [ -f "$SRC_DIR/starship.toml" ]; then
                if [ -e "$HOME/.config/starship.toml" ]; then
                    mv "$HOME/.config/starship.toml" "$HOME/.config/starship.toml.backup.${TIMESTAMP}"
                fi
                ln -sf "$SRC_DIR/starship.toml" "$HOME/.config/starship.toml"
                echo -e "${C_GREEN}[链接] ~/.config/starship.toml -> $SRC_DIR/starship.toml${C_RESET}"
            fi
            echo -e "\n${C_GREEN}[✓] 生产力终端运行时已成功部署！${C_RESET}"
        else
            echo -e "\n${C_YELLOW}[*] 已取消部署。${C_RESET}"
        fi
        exit 0
    fi

    # 单个桌面环境/窗口管理器部署 (Niri Shorin, Niri Vanilla, DMS, Hyprland)
    echo -e "\n${C_CYAN}----------------------------------------------------------------------${C_RESET}"
    echo -e "${C_BOLD}【预检执行计划 (Pre-Flight Plan)】${C_RESET}"
    echo -e "  ▸ 目标发行版: ${C_GREEN}${TARGET_DISTRO}${C_RESET}"
    echo -e "  ▸ 所选桌面组件: ${C_BOLD}${C_MAGENTA}${NAME}${C_RESET}"
    echo -e "  ▸ 配置源路径: ${SRC_DIR}"
    echo -e "  ▸ 系统部署路径: ${DEST_DIR}"
    if [ -e "$DEST_DIR" ]; then
        echo -e "  ▸ 自动安全备份: ${C_YELLOW}${DEST_DIR}.backup.${TIMESTAMP}${C_RESET}"
    else
        echo -e "  ▸ 自动安全备份: 目标路径不存在，无需备份"
    fi
    echo -e "  ▸ 链接模式: 安全绝对符号链接 (无损且方便随仓库保持同步)"
    echo -e "${C_CYAN}----------------------------------------------------------------------${C_RESET}"

    read -p "您确认要执行上述部署吗？请明确输入 [y/N]: " FINAL_CONFIRM
    if [[ ! "$FINAL_CONFIRM" =~ ^[Yy]$ ]]; then
        echo -e "\n${C_YELLOW}[*] 操作已取消，系统配置未发生任何变动。${C_RESET}"
        exit 0
    fi

    # 执行备份
    if [ -e "$DEST_DIR" ]; then
        echo -e "${C_BLUE}[*] 正在执行无损安全备份...${C_RESET}"
        mv "$DEST_DIR" "${DEST_DIR}.backup.${TIMESTAMP}"
        echo -e "${C_GREEN}[✓] 已成功备份至: ${DEST_DIR}.backup.${TIMESTAMP}${C_RESET}"
    fi

    # 确保父级目录存在
    mkdir -p "$(dirname "$DEST_DIR")"

    # 执行软链接
    echo -e "${C_BLUE}[*] 正在创建配置符号链接...${C_RESET}"
    ln -sf "$SRC_DIR" "$DEST_DIR"

    # 若部署了 Hyprland，同时自动链接配套的 Waybar 配置
    if [ "$WM_CHOICE" = "4" ] && [ -d "$SRC_DIR/waybar" ]; then
        if [ -e "$HOME/.config/waybar" ]; then
            mv "$HOME/.config/waybar" "$HOME/.config/waybar.backup.${TIMESTAMP}"
            echo -e "${C_GRAY}[备份] 已将原 ~/.config/waybar 备份为 ~/.config/waybar.backup.${TIMESTAMP}${C_RESET}"
        fi
        ln -sf "$SRC_DIR/waybar" "$HOME/.config/waybar"
        echo -e "${C_GREEN}[链接] ~/.config/waybar -> $SRC_DIR/waybar${C_RESET}"
    fi

    # 生成一键回滚脚本
    ROLLBACK_SCRIPT="$SCRIPT_DIR/rollback.sh"
    cat << EOF > "$ROLLBACK_SCRIPT"
#!/usr/bin/env bash
# 一键安全回滚脚本 (生成于 $TIMESTAMP)
echo "[*] 正在执行回滚..."
if [ -L "$DEST_DIR" ]; then
    rm "$DEST_DIR"
    echo "[✓] 已移除当前符号链接: $DEST_DIR"
fi
if [ -e "${DEST_DIR}.backup.${TIMESTAMP}" ]; then
    mv "${DEST_DIR}.backup.${TIMESTAMP}" "$DEST_DIR"
    echo "[✓] 已恢复历史配置: $DEST_DIR"
fi
echo "[✓] 回滚完成！"
EOF
    chmod +x "$ROLLBACK_SCRIPT"

    echo -e "\n${C_GREEN}${C_BOLD}[🎉 部署圆满完成！]${C_RESET}"
    echo -e "  - 当前生效配置: ${C_CYAN}${DEST_DIR}${C_RESET}"
    echo -e "  - 回滚脚本生成于: ${C_YELLOW}${ROLLBACK_SCRIPT}${C_RESET} (若需撤销部署随时运行即可)"
    echo -e "\n${C_MAGENTA}💡 启动与生效指引:${C_RESET}"
    if [ "$WM_CHOICE" = "1" ] || [ "$WM_CHOICE" = "2" ]; then
        echo -e "  - 若处于 TTY，直接输入: ${C_BOLD}niri-session${C_RESET} 或 ${C_BOLD}niri${C_RESET}"
        echo -e "  - 若已在 Niri 中运行，按下快捷键重载或重启会话生效。"
    elif [ "$WM_CHOICE" = "4" ]; then
        echo -e "  - 若处于 TTY，直接输入: ${C_BOLD}Hyprland${C_RESET}"
        echo -e "  - 默认终端快捷键: Super + Q (Foot/Kitty)"
        echo -e "  - 默认应用菜单: Super + Space (Fuzzel)"
    fi
    echo -e "${C_GRAY}======================================================================${C_RESET}\n"
}

# 流程总控
print_banner
detect_distro
select_distro
select_desktop
confirm_and_deploy
