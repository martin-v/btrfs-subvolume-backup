#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail


# install (test) requirements
apt-get -y install btrfs-tools
wget -q -N https://raw.githubusercontent.com/dansoton/assert.sh/assert-extras/assert.sh
wget -q -N https://raw.githubusercontent.com/dansoton/assert.sh/assert-extras/assert-extras.sh


# create kernel logfile for debuging CI failures.
sudo tail -n0 -f /var/log/kern.log > "$LOG_DIR"/kernel."$DATE".log & echo $! > kerneltail.pid



mkdir -p "$TMP_DIR"

function setupDisk() {
	# clean up for failed previous runs.
	umount "$TMP_DIR"/"$1" || true

	# create new disk
	dd if=/dev/zero of="$TMP_DIR"/"$1".img bs=1M count=100
	mkfs.btrfs "$TMP_DIR"/"$1".img

	# mount disk
	mkdir -p "$TMP_DIR"/"$1"
	mount "$TMP_DIR"/"$1".img "$TMP_DIR"/"$1"
}

setupDisk live
setupDisk backup
