. assert.sh --verbose
. assert-extras.sh


# init runs throu
assert_startswith "btrfs-subvolume-backup --init $LIVE_DIR $BACKUP_DIR" "Create a readonly snapshot of"


# end of test suite
assert_end "btrfs-subvolume-backup default tests"
