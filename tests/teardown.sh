#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

umount "$ORIGIN"
umount "$BACKUP"


kill "$(cat kerneltail.pid)"
rm kerneltail.pid
