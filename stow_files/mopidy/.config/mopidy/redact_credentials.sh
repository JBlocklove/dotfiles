#!/usr/bin/env bash

# This script reads the mopidy configuration from stdin and writes a redacted
# version to stdout. It only replaces hostname, username, and password lines
# within the [jellyfin] section with "***REDACTED***".

sed '/^\[jellyfin\]/,/^\[.*\]/ {
    s/^hostname = .*/hostname = ***REDACTED***/;
    s/^username = .*/username = ***REDACTED***/;
    s/^password = .*/password = ***REDACTED***/
}'

