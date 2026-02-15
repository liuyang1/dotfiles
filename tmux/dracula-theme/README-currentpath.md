# Tmux Smart Path Display

## 功能
在 tmux statusline 显示当前 pane 的智能路径，基于项目锚点（.git/.repo 等）自动识别并简化显示。

## 特性
- ✅ 无深度限制：向上搜索到根目录
- ✅ 锚点自动识别：基于 .git, .repo, .hg 等标记文件
- ✅ 完整路径显示：锚点后的完整相对路径（无折叠）
- ✅ Powerline 风格：与 Dracula 主题完美集成
- ✅ 高性能：Python 实现 + 路径缓存
- ✅ 柔和配色：dark_purple 背景，与其他插件协调

## 显示效果示例
```
[audioclient]/omnikit/audiomanager/src/main/java/com/example
[dotfiles]/tmux
[kanto162]/img
…/Downloads/av/song  (无锚点时的 fallback)
```

## 配置

### ~/.tmux/local.conf
```bash
# 路径显示风格
# basename: 仅显示目录名
# full: 完整路径
# smart: 智能锚点模式（推荐）
set -g @dracula-path-style "smart"

# 锚点标记文件（空格分隔）
set -g @dracula-path-markers ".git .repo .hg"

# 颜色配置（可选）
# 默认：dark_purple white（柔和背景）
# 其他选项：gray, dark_gray, cyan, green, orange 等
set -g @dracula-currentpath-colors "dark_purple white"
```

### ~/.tmux/dracula.conf
```bash
# 在 plugins 列表中添加 currentpath
set -g @dracula-plugins "currentpath checkadb checkmw checkdsk checkvpn"
```

## 实现文件
- `~/.tmux/dracula-theme/current-path.py` - Python 核心逻辑
- `~/.tmux/dracula-theme/current-path.sh` - Shell wrapper
- `~/.tmux/dracula-theme/dracula.sh` - 主题集成

## 工作原理
1. 从当前目录向上搜索标记文件（.git, .repo 等）
2. 找到标记文件所在目录作为"锚点"
3. 显示格式：`[锚点名]/相对路径`
4. 无锚点时 fallback 到显示最后 3 层目录

## 性能
- Python 实现，文件系统查找高效
- 路径结果缓存在 `~/.tmux/.path-cache`
- 相同路径直接读缓存，无需重复搜索
- 适合深层目录结构（测试过 18 层深度）
- 典型性能：首次 ~30ms，缓存命中 ~25ms
