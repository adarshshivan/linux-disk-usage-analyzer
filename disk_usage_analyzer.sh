#!/bin/bash
# =============================================
# Linux Disk Usage Analyzer
# Author: Adarsh Shivan
# =============================================

# Target directory (default: current)
TARGET_DIR=${1:-$(pwd)}

echo "🔍 Analyzing disk usage in: $TARGET_DIR"
echo "==============================================="

# Display top 10 largest directories/files
echo -e "\n📁 Top 10 Largest Directories/Files:"
du -ah "$TARGET_DIR" 2>/dev/null | sort -rh | head -n 10

# Display disk usage summary
echo -e "\n💽 Disk Usage Summary:"
du -sh "$TARGET_DIR"/* 2>/dev/null

# Display overall filesystem usage
echo -e "\n🧮 System Partition Usage:"
df -h | grep -E 'Filesystem|/dev/'

# Optional log file creation
LOG_FILE="disk_usage_report_$(date +%F).log"
{
  echo "Disk Usage Report - $(date)"
  du -ah "$TARGET_DIR" | sort -rh | head -n 10
  echo -e "\nTotal Usage: $(du -sh "$TARGET_DIR" | cut -f1)"
} > "$LOG_FILE"

echo -e "\n✅ Report saved as: $LOG_FILE"
echo "==============================================="

