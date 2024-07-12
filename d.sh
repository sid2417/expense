#!/bin/bash
# df -hT | grep xfs
# /dev/mapper/RootVG-rootVol   xfs       6.0G  1.8G  4.2G  30% /
# /dev/mapper/RootVG-homeVol   xfs       960M   40M  921M   5% /home
# /dev/mapper/RootVG-varVol    xfs       2.0G  327M  1.7G  17% /var
# /dev/mapper/RootVG-logVol    xfs       2.0G   72M  1.9G   4% /var/log
# /dev/mapper/RootVG-varTmpVol xfs       2.0G   47M  1.9G   3% /var/tmp
# /dev/mapper/RootVG-auditVol  xfs       4.4G   64M  4.3G   2% /var/log/audit
# /dev/xvda3                   xfs       424M  223M  202M  53% /boot


# FOLDER=$($DISC_DETAILS | awk -F " " '{print $NF}')
# CURRENT_THRESHOLD=$($DISC_DETAILS | awk -F " " '{print $6F}' | cut -d "%" -f1)
#df -hT | grep xfs |
#/dev/xvda1     xfs        10G  1.8G  8.3G  18% /
DISC_DETAILS=$(df -hT | grep xfs)
LIMIT=0
MESSAGE=""


#echo "$FOLDER... $CURRENT_THRESHOLD"
while IFS= read -r line
do
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    CURRENT_THRESHOLD=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    if [ $CURRENT_THRESHOLD -ge $LIMIT ]
    then
        MESSAGE+="Currently your disc  $FOLDER $CURRENT_THRESHOLD exceeds the threshold limit $LIMIT "
        MESSAGE+="$FOLDER exceeded the threshold limit is $THRESHOLD_LIMIT , your current disc usage is : $DISC_THRESHOLD_VALUE \n"
    fi

done <<< $DISC_DETAILS

echo -e "Please Alert : $MESSAGE"

# df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1
# df -hT | grep xfs | awk -F " " '{print $NF}'