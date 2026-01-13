# Exit on Error

```shell
set -e

```

## Trap Signals

```shell
trap 'echo "Error occurred"; cleanup; exit 1' ERR

function cleanup() {
  # Cleanup code
  echo "Cleaning up"
}

```

## Logging

```shell
logfile="script.log"
exec > >(tee -i $logfile)
exec 2>&1

echo "Script started"

```
