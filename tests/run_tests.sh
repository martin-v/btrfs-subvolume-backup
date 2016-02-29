#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

export DATE="$(date -Is)"
export PATH="$PATH:/vagrant:/vagrant/tests"
export LOG_DIR="/vagrant/tests/logs/"

mkdir -p $LOG_DIR

# Store stdin and redirect it to a log.
exec 201>&1
exec >$LOG_DIR/testsetup."$DATE".log 2>&1
set -o xtrace


export TMP_DIR="/tmp/btrfs-subvolume-backup-testdir"
export LIVE_DIR="$TMP_DIR"/live
export BACKUP_DIR="$TMP_DIR"/backup

prepare.sh
# Resore stdin for test results.
exec 1>&201 201>&-
exec > >(tee -i $LOG_DIR/testrun."$DATE".log)


test_default.sh


# Redirect stdin again to logfile.
exec >>$LOG_DIR/testsetup."$DATE".log 2>&1

teardown.sh
