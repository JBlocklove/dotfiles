#!/usr/bin/env bash

# This script reads a khal config from stdin and writes out a redacted version
# that replaces the entire [calendars] section with a single "***REDACTED***" line.
#
# Edits are restricted to the [calendars] through [locale] block.
# It deletes all blank lines and any lines that do not start with '[' in that section.
# After the [calendars] line, it inserts a single "***REDACTED***" line.

sed '
/^\[calendars\]/,/^\[locale\]/ {
    /^$/d
    /^[^[]/d
    /^\[calendars\]$/a\
    \t***REDACTED***
}
'

