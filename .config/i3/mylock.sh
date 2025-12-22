#!/bin/bash
IMAGE="$HOME/Pictures/wallpapers/sheep.jpg"
TEMP_RAW="/tmp/i3lock.raw.$$"

# 获取尺寸
DIMENSIONS=$(identify -format '%wx%h' "$IMAGE" 2>/dev/null || echo "1920x1080")

# 转换并锁屏
magick "$IMAGE" RGB:- >"$TEMP_RAW"
i3lock --raw "${DIMENSIONS}:rgb" --image "$TEMP_RAW"

# 清理
rm -f "$TEMP_RAW"
