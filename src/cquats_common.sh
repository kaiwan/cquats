#!/bin/bash
# cquats_common.sh
# 
# Quick Description:
# CQuATS - C QA ToolSet project
# 
# Common 'header' file.
#
# Last Updated :
# Created      : 21Sep2017
# 
# Author:
# Kaiwan N Billimoria
# kaiwan -at- kaiwantech -dot- com
# kaiwanTECH
# 
# License: GPLv2

########### Globals follow #########################
# Style: gNameOfGlobalVar

set -a   # export all

gPRJ="CQuATS - the C/C++ QA ToolSet"
gInitMsg=\
"
@@@ ${name}: WARNING! Don't blindly act on \"${gPRJ}\"'s output @@@
@@@ False positives can and do occur. Carefully audit and Verify your code.    @@@
@@@ (Also, this toolset works only on C source/header files, nothing else)     @@@
"

#------------------------------------------------------------------
# CQuATS Mode :: GitHub Direct -OR- Distro Install
# This branch 'reorg1' has CQuATS in the "Distro Install" mode.
# Use the 'master' branch for CQuATS in the "GitHub Direct" mode.
#------------------------------------------------------------------
MODE="DISTRO_INSTALL"

INSTDIR=/usr/share/cquats
#LOCAL_INSTDIR=~/cquats
TOP=$(pwd)
LOCAL_INSTDIR=${TOP}
MENUDIR=${INSTDIR}/kbuild

# Setup the 'scratch' folder
gCQUATS_SCRATCH_FOLDER=${LOCAL_INSTDIR}/.scratch_cquats
#------------------------------------------------------------------

CONFIG_FILE=${LOCAL_INSTDIR}/.config
gTMPF_CONFIG=${gCQUATS_SCRATCH_FOLDER}/.tmpconfig
TOOLS_LOC=${INSTDIR}/tools
TOOLS_STATIC=${TOOLS_LOC}/static
TOOLS_PERF_FLMGR=${TOOLS_LOC}/perf/FlameGraph

#---------Functions----------------------------------------------------
LN="+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echolog()
{
#[ $# -eq 0 ] && return
echo "${LN}
[$(date +%a_%d%b%Y_%T.%N)]:$@"
#${LN}"
}

#----------------------------------------------------------------------
report_progress()
{
local frame=1
printf "$(date +%F.%H%M%S):${BASH_SOURCE[${frame}]}:${FUNCNAME[${frame}]}:${BASH_LINENO[0]}\n"
}

# Run this func in the background
progress_wheel()
{
while [ true ]
do
  for item in \| \/ \- \\ \| \/ \- \\
  do
    printf "      %c\r" ${item}
    sleep 0.2
  done
done
}
