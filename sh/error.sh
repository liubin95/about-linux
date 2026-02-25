#!/bin/bash
#######################################
# description 清理任务
# Arguments:
#  None
#######################################
function cleanup() {
  echo "Cleanup started"
  echo "Cleanup completed"
}

#######################################
# description 主函数
# Arguments:
#  None
#######################################
function main() {
  # 调用 common.sh
  source "$(dirname "$0")/common.sh"
  # 验证参数
  require_code
  echo "Script started with code $code"
  echo "Error will be triggered"
  local i
  for ((i = 0; i < 10; i++)); do
    echo "Iteration $i"
    sleep 1
    if [[ "$i" -eq 9 ]]; then
      cat non_existent_file
    fi
  done
  cleanup
  exit 0
}
main "$@"
