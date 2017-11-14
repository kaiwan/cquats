#!/bin/bash
# cquats_common.sh
# 
# Quick Description:
# CQuATS - C QA ToolSet project
# 
# Common 'header' file.
#
# Last Updated : 14Nov2017
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
# This branch 'master' has CQuATS in the "GitHub Direct" mode.
# Use the 'reorg1' branch for CQuATS in the "Distro Install" mode.
#------------------------------------------------------------------
MODE="GITHUB_DIRECT"

TOP=$(pwd)
MENUDIR=${TOP}/kbuild
CONFIG_FILE=${MENUDIR}/.config

# Setup the 'scratch' folder
gCQUATS_SCRATCH_FOLDER=${TOP}/.scratch_cquats
mkdir -p ${gCQUATS_SCRATCH_FOLDER} 2>/dev/null

gTMPF_CONFIG=${gCQUATS_SCRATCH_FOLDER}/.tmpconfig
TOOLS_LOC=${TOP}/tools
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
