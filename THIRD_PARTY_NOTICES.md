# 第三方来源与许可证说明

本仓库根目录的 [LICENSE](./LICENSE) 为 MIT License，**仅适用于本仓库的原创内容**。
下列文件或目录来自第三方项目，继续沿用各自原有许可证，不受 MIT 覆盖。

## 1. SHORiN-KiWATA 的配置与脚本

部分桌面配置、窗口规则与部署思路改编或整理自 [@SHORiN-KiWATA（Shorin 大老师）](https://github.com/SHORiN-KiWATA) 的公开仓库。已在此致谢。

| 路径 | 上游仓库 | 上游许可证 | 说明 |
| :--- | :--- | :--- | :--- |
| `setup.sh`（部分流程与交互思路）、`distros/arch/packages.txt` 等清单中可能的改编内容 | [SHORiN-KiWATA/shorin-arch-setup](https://github.com/SHORiN-KiWATA/shorin-arch-setup) | **AGPL-3.0** | 一键配置脚本仓库。再分发其中改编内容时，请遵守 AGPL-3.0。 |
| `desktops/niri-shorin/`（含 `shorin-windowrules.kdl`、`scripts/`、`layout.kdl`、`animations.kdl`、`blur.kdl`、`config.kdl` 等） | [SHORiN-KiWATA/shorin-niri](https://github.com/SHORiN-KiWATA/shorin-niri) | **上游未声明许可证** | 见下方「待用户决定」说明。 |
| `desktops/niri-shorin/dms/`、`desktops/dms/` | [SHORiN-KiWATA/shorin-dms-hyprniri](https://github.com/SHORiN-KiWATA/shorin-dms-hyprniri) | **上游未声明许可证** | 见下方「待用户决定」说明。相关生态亦可见 [shorin-dux-niri](https://github.com/SHORiN-KiWATA/shorin-dux-niri)（同样未声明许可证）。 |
| `desktops/common-shell/fish/functions/apt.fish` | 上述 Shorin 配置中的辅助函数 | **随上游，未单独声明** | 与 `shorin` 命令联动的软件包管理封装。 |

### 待用户决定：未声明许可证的 Shorin 内容

`desktops/niri-shorin/`（含 `shorin-windowrules.kdl` 与 `dms/` 子目录）以及部分 `desktops/dms/` 内容来自 **shorin-niri**、**shorin-dms-hyprniri**。这两个上游仓库目前没有声明许可证。

上述内容**暂不删除**：已向作者致谢；如需移除或改为仅保留自行编写的部分，请联系仓库维护者后再处理。在上游补上许可证之前，再分发这些文件可能存在权利不明确的风险。

## 2. Kitty 搜索插件（GPL-3.0）

| 路径 | 上游仓库 | 上游许可证 |
| :--- | :--- | :--- |
| `desktops/common-shell/kitty/search.py` | [trygveaa/kitty-kitten-search](https://github.com/trygveaa/kitty-kitten-search) | **GPL-3.0** |

该文件文件头已注明来源与 GPL-3.0。其再分发须遵守 GNU GPL v3。

## 3. 其他说明

- 本清单力求覆盖已知的第三方源码；若仍有遗漏，以文件内版权声明与上游仓库为准。
- 使用或再分发本仓库时，请同时遵守 MIT（仅原创部分）以及上表中各第三方许可证。
