#!/usr/bin/env bash

print_status() {
    local state track

    state=$(mpc status 2>/dev/null \
        | sed -n '2p' \
        | awk '{print $1}' \
        | tr -d '[]' \
        | tr '[:upper:]' '[:lower:]')
    track=$(mpc current 2>/dev/null)

    if [ -z "$track" ] || [[ "$state" != "playing" && "$state" != "paused" ]]; then
        printf '{"text": "", "alt": ""}\n'
        return
    fi

    printf '{"text": "%s", "alt": "%s"}\n' \
        "$track" "$state"
}

# give Waybar an initial payload
print_status

# then whenever MPD’s “player” subsystem changes, re-print (even when stopped)
mpc idleloop player | while read -r _; do
    print_status
done

