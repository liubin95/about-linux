#!/bin/bash
# 共用配置：被各 *.sh 通过 source 引用
# 用法: source "$(dirname "$0")/common.sh"
#
# 参数约定：
# - 需要 code/platform 的脚本：source 后调用 require_code_platform
# - 不需要参数的脚本（如 clean.sh）：只 source，不调用 require_code_platform

# 需要 code/platform 的脚本请在 source 后调用本函数
function require_code_platform() {
  if [[ -z "$code" || -z "$platform" ]]; then
    echo "Usage: $(basename "${BASH_SOURCE[1]:-$0}") <code> <platform>"
    exit 1
  fi
}

# 需要 code 的脚本请在 source 后调用本函数
function require_code() {
  if [[ -z "$code" ]]; then
    echo "Usage: $(basename "${BASH_SOURCE[1]:-$0}") <code>"
    exit 1
  fi
}

#######################################
# description 设置一些东西
# Arguments:
#  None
#######################################
function setup() {
  set -e
  local timestamp
  timestamp="$(date +%Y%m%d%H%M%S)"
  local logfile="$timestamp.log"
  exec > >(tee -i "$logfile")
  exec 2>&1

  trap 'echo "Error occurred"; cleanup; exit 1' ERR
  trap 'echo "程序终止(interrupt)信号，在用户键入 Ctrl+C 时发出"; cleanup; exit 1' SIGINT
  # SIGKILL/SIGSTOP can not be trapped.
  # trap 'echo "用来立即结束程序的运行。本信号不能被阻塞，处理和忽略。"; cleanup; exit 1' SIGKILL
  trap 'echo "程序结束(terminate)信号, 与SIGKILL不同的是该信号可以被阻塞和处理. 通常用来要求程序自己正常退出；kill 命令缺省产生这个信号。"; cleanup; exit 1' SIGTERM

}

#######################################
# description 主函数
# Arguments:
#  None
#######################################
function main() {
  setup
  declare script_dir
  # 脚本目录
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
  # 导出一些公共变量
  export data_dir="$script_dir/data"

  # 导出一些公共参数
  # 若调用时传了 $1 $2 则导出，否则留空（供不需要参数的脚本使用）
  export code="${1:-}"
  export platform="${2:-}"
}

main "$@"


