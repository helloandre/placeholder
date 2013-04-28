#!/bin/sh

### BEGIN INIT INFO
# Provides:          placeholder
# Required-Start:    $all
# Required-Stop:     $all
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts the placeholder server
# Description:       starts placeholder using start-stop-daemon
### END INIT INFO

PATH=/sbin:/bin:/usr/sbin:/usr/bin

BIN=/path/to/main
PIDFILE=/var/run/placeholder.pid
USER=nobody
GROUP=nogroup

test -f $BIN || exit 0
set -e
case "$1" in
    start)
        echo -n "Starting placeholder server: "
        start-stop-daemon --start --chuid $USER:$GROUP --make-pidfile --background --pidfile $PIDFILE --exec $BIN -- $BINARGS
        echo "placeholder."
        ;;
    stop)
        echo -n "Stopping placeholder server: "
        start-stop-daemon --stop --quiet --pidfile $PIDFILE --exec $BIN
        rm -f $PIDFILE
        echo "placeholder."
        ;;
    restart)
        echo -n "Restarting placeholder server: "
        $0 stop
        sleep 1
        $0 start
        echo "placeholder."
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}" >&2
        exit 1
        ;;
esac
exit 0