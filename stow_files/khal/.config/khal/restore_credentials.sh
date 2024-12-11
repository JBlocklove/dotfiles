#!/usr/bin/env bash

# This script restores the [calendars] section previously redacted by
# `redact_credentials.sh`.
#
# The SECRETS_FILE should contain only the calendar entries (without the [calendars] header).
#
# The logic:
# 1. When we encounter [calendars], print it.
# 2. Skip the next line (which will be ***REDACTED***).
# 3. Insert the calendar data from $SECRETS_FILE.
# 4. Print all other lines as-is.

SECRETS_FILE="$HOME/.config/khal/secrets.conf"
CAL_DATA=$(cat "$SECRETS_FILE")

awk -v caldata="$CAL_DATA" '
/^\[calendars\]$/ {
  print
  getline
  print caldata
  next
}
{ print }
'

