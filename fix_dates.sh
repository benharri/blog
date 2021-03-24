#!/bin/sh

set -e

for i in ./*.md; do
    if [ "$(basename "$i")" = _index.md ]; then
        continue
    fi

    timestamp=$(grep "^date:" "$i" | cut -d ' ' -f 2 | xargs echo -n)
    printf "%s: %s " "$i" "$timestamp"
    formatted_date=$(python3 -c "print(__import__('datetime').datetime.strptime('$timestamp', '%Y%m%d%H%M.%S').isoformat())")
    printf "%s\n" "$formatted_date"
    sed -i'' "s/$timestamp/$formatted_date/" "$i"
done
