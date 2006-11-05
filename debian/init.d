#!/bin/sh
#
# $Id$
#
### BEGIN INIT INFO
# Provides:          xfs xfstt
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs $network
# Should-Start:
# Should-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: xfstt sysv init script
# Description:       xfstt is a TrueType font server for X
### END INIT INFO
#
# Written by
# Stephen Carpenter <sjc@debian.org>,
# Gergely Egervary <mauzi@lin.lkg.c3.hu> and
# Guillem Jover <guillem@debian.org>.
#

PATH=/bin:/usr/bin:/sbin:/usr/sbin
XFSTT=/usr/bin/xfstt
DESC="X font server"
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

. /lib/lsb/init-functions

case "$1" in
    start)
	log_daemon_msg "Starting $DESC" "xfstt"
	start-stop-daemon --start --quiet --pidfile $PIDFILE \
		--exec $XFSTT -- $ARGS
	log_end_msg $?
    ;;

    stop)
	log_daemon_msg "Stopping $DESC" "xfstt"
	start-stop-daemon --stop --quiet --pidfile $PIDFILE \
		--exec $XFSTT
	log_end_msg $?
    ;;

    force-reload|restart)
	$0 stop
	log_action_begin_msg "Reloading $DESC configuration"
	$XFSTT --sync >/dev/null
	log_action_end_msg $?
	$0 start
    ;;

    *)
	echo "Usage: /etc/init.d/xfstt {start|stop|force-reload|restart}"
	exit 1
    ;;
esac

exit 0

# vim: syn=sh:

