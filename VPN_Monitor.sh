#!/bin/bash
# To detect the service of VPN, and restart it automatically...
 
ps aux| grep shadowsocks| grep -v 'grep shadowsocks' > /dev/null
retval=`echo $?`
if [ $retval == 0 ];then
  echo -e "`date +%F\ %H\:%M`:\nShadowsocks is already running... Exit!" >> /root/cron.run
  exit 1
fi

if [ $retval != 0 ];then
  echo "Shadowsocks service has die! Trying to restart it..."
  ssserver -c /etc/shadowsocks.json -d start
    ps aux| grep shadowsocks| grep -v 'grep shadowsocks' > /dev/null
    retval_new=`echo $?`
      if [ $retval_new == 0 ];then
        echo "Shadowsocks service has started."
      else
        echo "Restart shadowsocks failed. Please try again."
      fi
fi



# crontab -l
1 */1 * * * /root/monitor.sh >>/root/cron.run 2>>/root/cron.err

每小时执行一次脚本, 确保vpn的正常运行和提供服务.
