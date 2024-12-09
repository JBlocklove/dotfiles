#!/usr/bin/env bash

SECRETS_FILE="$HOME/.config/mopidy/secrets.conf"

# Extract values from secrets.conf
HOSTNAME=$(grep '^HOSTNAME=' "$SECRETS_FILE" | cut -d'=' -f2 | tr -d ' ')
USERNAME=$(grep '^USERNAME=' "$SECRETS_FILE" | cut -d'=' -f2 | tr -d ' ')
PASSWORD=$(grep '^PASSWORD=' "$SECRETS_FILE" | cut -d'=' -f2 | tr -d ' ')

# Escape '&' in the secrets so awk won't treat them as a special character
HOSTNAME=$(printf '%s' "$HOSTNAME" | sed 's/&/\\\\&/g')
USERNAME=$(printf '%s' "$USERNAME" | sed 's/&/\\\\&/g')
PASSWORD=$(printf '%s' "$PASSWORD" | sed 's/&/\\\\&/g')

# Use awk to replace redacted placeholders with actual secrets.
# Note: The pattern uses asterisks unescaped because it's a known exact placeholder.
# If these placeholders ever vary, consider more precise patterns or escaping.
awk -v hostname="$HOSTNAME" -v username="$USERNAME" -v password="$PASSWORD" '
{
  gsub(/hostname = \*\*\*REDACTED\*\*\*/, "hostname = " hostname);
  gsub(/username = \*\*\*REDACTED\*\*\*/, "username = " username);
  gsub(/password = \*\*\*REDACTED\*\*\*/, "password = " password);
  print;
}
'
