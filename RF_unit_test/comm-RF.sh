#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script for rtk_openwrt 
# JC Yu,     Novenber 26,2015
# -------------------------------------------------------
# IMPORTANT:
#   When use: './<this script file>  '
# -------------------------------------------------------
#TODAY=`date +"%Y-%m%d-%H%M"`
PPWW=`pwd`

:${ONT_ID_DEFAULT:=172.17.10.8} 


BLOG_DIR="RF-log"
BLOG_DIR_WK=${PPWW}/${BLOG_DIR}
Record_File=${BLOG_DIR_WK}/rf-test-log.txt

echo "PPWW=${PPWW}"
echo "ONT_ID=${ONT_ID}"
echo "BLOG_DIR=${BLOG_DIR}"
echo "BLOG_DIR_WK=${BLOG_DIR_WK}"
echo "Record_File=${Record_File}"

WaitForAnyKey(){
echo "==>$1"
 if [ ! -n "$SKIP_WAIT" ]; then
read -p "Please press any key to continue.."  temp
fi
}


