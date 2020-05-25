#!/bin/bash
# Running a project, by Saurav Shekhar, sauravshekhar01@gmail.com

RED='\033[0;31m'
HRED='\033[1;41m'
BROWN='\033[2;33m'
HCYAN='\033[1;46m'
GREEN='\033[0;32m'
HGREEN='\033[1;42m'
HPURPLE='\033[1;45m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo_and_run() { 
  echo -e "${BROWN}\$ $@${NC}" ; 
  "$@" ; 
}

echo_run_and_log() { 
  logfile="$1"; shift
  echo -e "${BROWN}\$ $@${NC}" ; 
  echo "$@" > ${logfile} ; 
  "$@" 2>&1 | tee -a ${logfile} ; 
  # remove unreadable characters from log 
  sed -i $'s/[^[:print:]\t]//g' ${logfile}
}

# exit on fail
set -e

##### Declare paths ####


##### Build #####


##### Test #####


##### Run ####
