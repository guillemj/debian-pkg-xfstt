#!/bin/sh
#
# xfstt sysv init script
#
# Stephen Carpenter <sjc@debian.org>,
# Gergely Egervary <mauzi@lin.lkg.c3.hu> and
# Guillem Jover <guillem@debian.org>.
#
# $Id$
#

PATH=/bin:/usr/bin:/sbin:/usr/sbin
XFSTT=/usr/bin/xfstt
DESC="X TrueType font server"
PIDFILE=/var/run/xfstt.pid
CONFIGFILE=/etc/default/xfstt

# To change the default port and/or user modify and uncomment
portno=7101
newuser=nobody
#portarg="--port $portno"
#userarg="--user $newuser"

daemon="--daemon"

ARGS="$daemon $portarg $userarg"

test -x "$XFSTT" || exit 0

if [ -e $CONFIGFILE ]; then
	. $CONFIGFILE
else
	LISTEN_TCP=no
fi

if [ "$LISTEN_TCP" = no ]; then
	ARGS="$ARGS --notcp"
fi

set -e

case "$1" in
    start)
	echo -n "Starting $DESC: xfstt"
	start-stop-daemon --start --quiet --pidfile $PIDFILE \
		--exec $XFSTT -- $ARGS || echo -n " start failed"
	echo "."
    ;;

    stop)
	echo -n "Stopping $DESC: xfstt"
	start-stop-daemon --stop --quiet --pidfile $PIDFILE \
		--exec $XFSTT ||  echo -n " not running"
	echo "."
    ;;

    force-reload|restart)
	echo "Reloading $DESC configuration..."
	$0 stop
	$XFSTT --sync
	$0 start
    ;;

    *)
	echo "Usage: /etc/init.d/xfstt {start|stop|force-reload|restart}" >&2
	exit 1
    ;;
esac

exit 0

