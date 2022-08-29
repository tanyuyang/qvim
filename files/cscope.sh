#!/bin/sh
find \( -path './out' -o -path './.repo' -o -path './tools' \) -prune -o -type f \( -name "*.h" -o -name "*.c" -o -name "*.java" -o -name "*.mk" -o -name "*.xml" -o -name "*.cpp" -o -name "*.s" \) -print > cscope.files
cscope -bq
