#!/bin/bash
set -e

if [[ -x "/entrypoint-app.sh" ]]
then
    echo "Executing app specific entrypoint script"
    /entrypoint-app.sh $@
fi

case "$1" in
    run)
        exec npm-start
    ;;
    migrate)
        # Migrate database to latest version
        exec node_modules/.bin/db-migrate up
    ;;
    help|usage)
        printf "Node on Docker\n  entrypoint.sh [run | migrate | help | usage | <command>]"
    ;;
    *)
        exec "$@"
    ;;
esac
