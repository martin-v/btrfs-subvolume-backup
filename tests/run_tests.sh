#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

export DATE="$(date -Is)"
export PATH="$PATH:/vagrant:/vagrant/tests"
export LOG_DIR="/vagrant/tests/logs/"

mkdir -p $LOG_DIR

# Store stdin&stderr and redirect it to a log.
exec 201>&1 202>&2
exec >$LOG_DIR/testsetup."$DATE".log 2>&1
set -o xtrace


export TMP_DIR="/tmp/btrfs-subvolume-backup-testdir"
export ORIGIN="$TMP_DIR"/origin
export BACKUP="$TMP_DIR"/backup
export LIVE_DIR="$TMP_DIR"/origin/live


prepare.sh
# Resore stdin for test results.
exec 1>&201 201>&- 2>&202 202>&-
exec > >(tee -i $LOG_DIR/testrun."$DATE".log) 2>&1


test_help.sh
test_default.sh
test_cleanup.sh


# Redirect stdin again to logfile.
exec >>$LOG_DIR/testsetup."$DATE".log 2>&1

teardown.sh
