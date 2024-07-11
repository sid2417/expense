# df -hT |grep xfs | awk -F " " '{print $NF}'
# /
# /home
# /var
# /var/log
# /var/tmp
# /var/log/audit
# /boot

# df -hT |grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1
# 30
# 5
# 17
# 4
# 3
# 2
# 53

# df -hT | grep xfs
# /dev/mapper/RootVG-rootVol   xfs       6.0G  1.8G  4.2G  30% /
# /dev/mapper/RootVG-homeVol   xfs       960M   40M  921M   5% /home
# /dev/mapper/RootVG-varVol    xfs       2.0G  327M  1.7G  17% /var
# /dev/mapper/RootVG-logVol    xfs       2.0G   72M  1.9G   4% /var/log
# /dev/mapper/RootVG-varTmpVol xfs       2.0G   47M  1.9G   3% /var/tmp
# /dev/mapper/RootVG-auditVol  xfs       4.4G   64M  4.3G   2% /var/log/audit
# /dev/xvda3                   xfs       424M  223M  202M  53% /boot


DISC_USAGE=$(df -hT | grep xfs)
THRESHOLD_LIMIT=10
MESSAGE=""

while IFS= read -r line
do
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    DISC_THRESHOLD_VALUE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    if [ $DISC_THRESHOLD_VALUE -ge $THRESHOLD_LIMIT ]
    then
        MESSAGE+="$FOLDER exceeded the threshold limit is $THRESHOLD_LIMIT , your current disc usage is : $DISC_THRESHOLD_VALUE "
    fi

done <<<$DISC_USAGE 

echo -e "Message : $MESSAGE"

echo "$MESSAGE" | mail -s "Disc Usage Alert..." siddhartha.java9398@gmail.com
#echo "$MESSAGE" | mail -s "Disk Usage Alert" info@joindevops.com

# echo "body" | mail -s "subject" to-address