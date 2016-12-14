#!/bin/bash
# To start or stop svn service
# chkconfig: 2345 54 45
# discription: to admin snv service.

start () {
if ps aux |grep svnserve |grep -v grep &> /dev/null; then
  echo "Service already started. exit..."
else
  echo "Start svn service ..."
  svnserve -d -r /home/svn/svndata/
fi
}

stop () {
if ps aux |grep svnserve |grep -v grep &> /dev/null; then
  echo "Kill svn service ..."
  killall svnserve
else
  echo "No svn service started ..."
fi
}

status () {
if ps aux |grep svnserve |grep -v grep &> /dev/null; then
  echo "svn service is running ..."
else
  echo "svn service has been stoped ..."
fi
}

help () {
echo "Usage: `basename $0` start|stop|restart|status|--help"
}

case $1 in
start)
  start ;;
stop)
  stop ;;
restart)
  stop
  sleep 1
  start ;;
status)
  status ;;
*)
  help
esac

