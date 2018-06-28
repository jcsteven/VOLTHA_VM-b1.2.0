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
echo "Start:Prepare :${TODAY}=> REBOOT" | tee -a $Record_File

#--- A.1 Software REBOOT
A_1="y"
if [[ "${A_1}" == "y" ]]; then
	echo "Start: A.1 Software REBOOT:${TODAY}" | tee -a $Record_File
	curl --insecure -v  "USER_TOKEN=Yes" -X POST -d '{"ResetType":"ForceRestart"}' \
	https://${ONT_ID}:8888/redfish/v1/Systems/1/Actions/ComputerSystem.Reset   |  tee -a $Record_File
	echo "End : A.1 Software REBOOT:${TODAY}" | tee -a $Record_File
fi

#--- A.2 Hardware REBOOT
#A_2="y"
if [[ "${A_2}" == "y" ]]; then
	echo "Start: A.2 Hardware REBOOT:${TODAY}" | tee -a $Record_File
	curl --insecure -v  "USER_TOKEN=Yes" -X POST -d '{"ResetType":"GracefulRestart"}' \
	https://${ONT_ID}:8888/redfish/v1/Systems/1/Actions/ComputerSystem.Reset |  tee -a $Record_File
	echo "End : A.2 Hardware REBOOT:${TODAY}" | tee -a $Record_File
fi

e_time=$(date +%s)
elap_s=$((e_time-s_time))
ss=$((elap_s%60))
mm=$(((elap_s/60)%60))
hh=$((elap_s/3600))
echo "==============================================================================" | tee -a $Record_File
echo "End  :Prepare :${TODAY}=> REBOOT" | tee -a $Record_File
echo "Build total time: $hh:$mm:$ss" | tee -a $Record_File
echo "==============================================================================" | tee -a $Record_File

