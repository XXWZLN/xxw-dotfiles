#!/bin/bash

# Terminal Colors Demo Script

echo "============================================"
echo "        Terminal Color & Style Demo"
echo "============================================"
echo ""

# Reset
RESET='\033[0m'

# Basic colors (30-37)
echo "--- Basic Foreground Colors ---"
for color in {0..7}; do
    echo -en "\033[${color}mColor ${color} (\\033[${color}m)${RESET} "
done
echo -e "\n"

# Basic background colors (40-47)
echo "--- Basic Background Colors ---"
for color in {40..47}; do
    echo -en "\033[${color}m BG ${color} ${RESET} "
done
echo -e "\n"

# High intensity colors (90-97)
echo "--- High Intensity Foreground ---"
for color in {90..97}; do
    echo -en "\033[${color}mColor ${color} (\\033[${color}m)${RESET} "
done
echo -e "\n"

# High intensity background (100-107)
echo "--- High Intensity Background ---"
for color in {100..107}; do
    echo -en "\033[${color}m BG ${color} ${RESET} "
done
echo -e "\n"

# Text styles
echo "--- Text Styles ---"
echo -e "${RESET}Normal text (default)"
echo -e "\033[1mBold text (\\033[1m)${RESET}"
echo -e "\033[2mDim text (\\033[2m)${RESET}"
echo -e "\033[3mItalic text (\\033[3m)${RESET}"
echo -e "\033[4mUnderlined text (\\033[4m)${RESET}"
echo -e "\033[5mBlinking text (\\033[5m)${RESET}"
echo -e "\033[7mInverted text (\\033[7m)${RESET}"
echo -e "\033[8mHidden text (\\033[8m)${RESET}"
echo -e "\033[9mStrikethrough text (\\033[9m)${RESET}"
echo ""

# Combined: color + style
echo "--- Combined: Bold + Colors ---"
for color in {31..37}; do
    echo -en "\033[1;${color}mBold Color ${color} (\\033[1;${color}m)${RESET} "
done
echo -e "\n"

# 256-color mode
echo "--- 256 Color Mode (Cube) ---"
echo -e "Standard colors (0-15):"
for c in {0..15}; do
    echo -en "\033[38;5;${c}m%3d${RESET} " $c
    [ $c -eq 7 ] && echo
done
echo -e "\n"

# Cursor styles (if supported)
echo "--- Cursor Color Examples (foreground) ---"
for style in {30..37}; do
    echo -en "\033[${style}m█${RESET} "
done
echo -e "\n"

echo "============================================"
echo "${RESET}Demo Complete!"
echo "============================================"
