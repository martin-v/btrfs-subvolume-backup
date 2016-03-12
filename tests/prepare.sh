#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail


# install (test) requirements
apt-get -q -y install btrfs-tools
wget -q -N https://raw.githubusercontent.com/dansoton/assert.sh/assert-extras/assert.sh
wget -q -N https://raw.githubusercontent.com/dansoton/assert.sh/assert-extras/assert-extras.sh


# create kernel logfile for debuging CI failures.
sudo tail -n0 -f /var/log/kern.log > "$LOG_DIR"/kernel."$DATE".log & echo $! > kerneltail.pid



mkdir -p "$TMP_DIR"

function setupDisk() {
	# clean up for failed previous runs.
	umount "$1" || true

	# create new disk
	dd if=/dev/zero of="$1".img bs=1M count=100
	mkfs.btrfs "$1".img

	# mount disk
	mkdir -p "$1"
	mount "$1".img "$1"
}

setupDisk "$ORIGIN"
setupDisk "$BACKUP"

btrfs subvolume create "$LIVE_DIR"
date > "$LIVE_DIR"/data
