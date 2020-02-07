#!/usr/bin/env bash
set -e

TEAM_IMAGE="wolves"

echo "Show the env vars..."
env

# Check for env variable TEAM
if [[ ${TEAM:+1} ]] ; then
  echo "Changing the team to ${TEAM}"
  TEAM_IMAGE=${TEAM}
else
  echo "Team is still: ${TEAM_IMAGE}"
fi

# Create the index file
cat << EOF > /data/www/html/index.html
<HTML>
  <HEAD>
    <TITLE>This is a test</TITLE>
  </HEAD>
  <BODY>
    <H2>The best football team is...</H2>
    <IMG SRC="images/${TEAM_IMAGE}.png" ALT="Best Team in the EPL">
  </BODY>
</HTML>
EOF

# Start nginx
# if [[ -z ${1} ]]; then
#   echo "Starting nginx..."
#   exec nginx -c /etc/nginx/nginx.conf ${EXTRA_ARGS}
# else
#   exec "$@"
# fi

echo "Teams are:"
ls -l /data/www/html/images/

exec nginx -c /etc/nginx/nginx.conf
