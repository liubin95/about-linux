#!/bin/bash
set -e
timestamp=$(date +%Y%m%d%H%M%S)
logfile="$timestamp.log"
exec > >(tee -i "$logfile")
exec 2>&1

echo "Script started"
trap 'echo "Error occurred"; cleanup; exit 1' ERR
trap 'echo "程序终止(interrupt)信号，在用户键入 Ctrl+C 时发出"; cleanup; exit 1' SIGINT
# SIGKILL/SIGSTOP can not be trapped.
# trap 'echo "用来立即结束程序的运行。本信号不能被阻塞，处理和忽略。"; cleanup; exit 1' SIGKILL
trap 'echo "程序结束(terminate)信号, 与SIGKILL不同的是该信号可以被阻塞和处理. 通常用来要求程序自己正常退出；kill 命令缺省产生这个信号。"; cleanup; exit 1' SIGTERM

# shellcheck disable=SC2317
function cleanup() {
  echo "Cleanup started"
  echo "Cleanup completed"
}

echo "Error will be triggered"

for ((i = 0; i < 10; i++)); do
  echo "Iteration $i"
  sleep 1
  if [[ "$i" -eq 9 ]]; then
    cat non_existent_file
  fi
done

exit 0
