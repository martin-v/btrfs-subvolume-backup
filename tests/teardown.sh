#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

umount "$LIVE_DIR"
umount "$BACKUP_DIR"


kill "$(cat kerneltail.pid)"
rm kerneltail.pid
