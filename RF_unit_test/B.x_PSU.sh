#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script for rtk_openwrt 
# JC Yu,     Novenber 26,2015
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
TODAY=`date +"%Y-%m%d-%H%M"`
source comm-RF.sh

if [[ -n "$1" ]]; then
ONT_ID=$1
else
ONT_ID=${ONT_ID_DEFAULT}
fi

[ -d $BLOG_DIR_WK ] || mkdir $BLOG_DIR_WK
s_time=$(date +%s)
echo "==============================================================================" |  tee -a $Record_File
echo ".............................................................................." |  tee -a $Record_File
echo "Start:Prepare :${TODAY}=>B. OLT PSU STATUS to  RF Server[${ONT_ID}]" | tee -a $Record_File

#--- B.1 
B_1="y"
if [[ "${B_1}" == "y" ]]; then
    for i in {1..2};
	do
		echo "Start: B.${i} OLT PSU STATUS-#${i}" | tee -a $Record_File
		curl  --insecure -v --cookie "USER_TOKEN=Yes" \
		https://${ONT_ID}:8888/redfish/v1/Chassis/1/Power/PowerSupplies/${i} |python -m json.tool  |  tee -a $Record_File
		echo "End : B.${i} OLT PSU STATUS-#${i}" | tee -a $Record_File
		WaitForAnyKey  "End : B.${i} OLT PSU STATUS-#${i}"
	done
fi


e_time=$(date +%s)
elap_s=$((e_time-s_time))
ss=$((elap_s%60))
mm=$(((elap_s/60)%60))
hh=$((elap_s/3600))
echo "==============================================================================" | tee -a $Record_File
echo "End  :Prepare :${TODAY}=> B. OLT PSU STATUS" | tee -a $Record_File
echo "Build total time: $hh:$mm:$ss" | tee -a $Record_File
echo "==============================================================================" | tee -a $Record_File

