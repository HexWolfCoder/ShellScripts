#!/bin/bash
# find_big_files.sh — search files great then 1 Gb
# use: ./find_big_files.sh [directory]

. ./MyUtLib.sh

echo "ttt"

banner_show
echo -e "${GREEN} Searching start now! ${RESET}"



SEARCH_DIR="${1:-/}"

echo "search files great then 1G in: $SEARCH_DIR"
echo "----------------------------------------"

find "$SEARCH_DIR" -type f -size +1G -exec ls -lh {} \; 2>/dev/null | \
    awk '{print $5 "\t" $9}' | sort -hr

echo "----------------------------------------"
echo "Top-20 biggest files:"
find "$SEARCH_DIR" -type f -size +1G -printf '%s %p\n' 2>/dev/null | \
    sort -rn | head -20 | \
    awk '{printf "%.2f GB\t%s\n", $1/1024/1024/1024, $2}'
