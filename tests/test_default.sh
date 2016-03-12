. assert.sh --verbose
. assert-extras.sh


# init runs through
assert_success "btrfs-subvolume-backup --init $LIVE_DIR $BACKUP" "Create a readonly snapshot of"
assert "diff -r $LIVE_DIR $ORIGIN/live_last" ""
assert "diff -r $ORIGIN/live_last $BACKUP/live_last" ""
sleep 1

# change data
date > $LIVE_DIR/data

# normal runs through
assert_success "btrfs-subvolume-backup $LIVE_DIR $BACKUP"
assert "diff -r $LIVE_DIR $ORIGIN/live_last" ""
assert "diff -r $ORIGIN/live_last $BACKUP/live_last" ""
sleep 1

# change data
date > $LIVE_DIR/data

# normal again runs through again
assert_success "btrfs-subvolume-backup $LIVE_DIR $BACKUP"
assert "diff -r $LIVE_DIR $ORIGIN/live_last" ""
assert "diff -r $ORIGIN/live_last $BACKUP/live_last" ""

# end of test suite
assert_end "btrfs-subvolume-backup default tests"
