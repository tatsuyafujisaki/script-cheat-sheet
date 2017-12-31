#!/usr/bin/env bash

init_log() {
  LOG_DIR=$(cd ${0%/*}/../log && pwd && cd - > /dev/null)
  [ ! -e ${LOG_DIR} ] && mkdir -p ${LOG_DIR}
  LOG_FILE=$(readlink -f ${LOG_DIR}/$(basename ${0} .${0##*.}).$(date '+%Y%m%d').log)
  return 0
}
 
del_log() {
  find ${LOG_DIR} -mtime +7 -exec rm {} \;
  return 0
}
 
log_info() {
  echo "$(date '+%Y-%m-%d %a %H:%M:%S') ${0##*/}(${LINENO}): [INFO] ${1}" >> ${LOG_FILE}
  return 0
}
 
log_error() {
  echo "$(date '+%Y-%m-%d %a %H:%M:%S') ${0##*/}(${LINENO}): [ERROR] ${1}" >> ${LOG_FILE}
  exit_status=1
  return 0
}
 
exit_status=0
 
init_log
 
var=something
echo ${var} && log_info "Successfully did ${var}" || log_error "Failed to do ${var}"
 
del_log
 
exit ${exit_status}