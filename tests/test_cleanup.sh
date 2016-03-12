. assert.sh --verbose
. assert-extras.sh


# TODO use assert_contains_not instead of assert_success

# test default keep size
assert_success "btrfs-subvolume-backup --postfix cleanup1 --init $LIVE_DIR $BACKUP"
sleep 1
assert_success "btrfs-subvolume-backup --postfix cleanup1 $LIVE_DIR $BACKUP"
sleep 1
assert_success "btrfs-subvolume-backup --postfix cleanup1 $LIVE_DIR $BACKUP"
sleep 1
assert_success "btrfs-subvolume-backup --postfix cleanup1 $LIVE_DIR $BACKUP"
assert "ls -1 $ORIGIN | grep cleanup1_ro | wc -w" 4
assert "ls -1 $BACKUP | grep cleanup1_ro | wc -w" 4
sleep 1
assert_success "btrfs-subvolume-backup --postfix cleanup1 $LIVE_DIR $BACKUP"
assert "ls -1 $ORIGIN | grep cleanup1_ro | wc -w" 5
assert "ls -1 $BACKUP | grep cleanup1_ro | wc -w" 5
sleep 1
assert_success "btrfs-subvolume-backup --postfix cleanup1 $LIVE_DIR $BACKUP"
assert "ls -1 $ORIGIN | grep cleanup1_ro | wc -w" 5
assert "ls -1 $BACKUP | grep cleanup1_ro | wc -w" 5
sleep 1


# test prefix and changed keep size
assert_success "btrfs-subvolume-backup --postfix cleanup2 --init $LIVE_DIR $BACKUP"
sleep 1
assert_success "btrfs-subvolume-backup --postfix cleanup2 $LIVE_DIR $BACKUP"
assert "ls -1 $ORIGIN | grep cleanup2_ro | wc -w" 2
assert "ls -1 $BACKUP | grep cleanup2_ro | wc -w" 2
sleep 1
assert_contains "btrfs-subvolume-backup --postfix cleanup2 $LIVE_DIR $BACKUP --keep 2"
assert "ls -1 $ORIGIN | grep cleanup2_ro | wc -w" 2
assert "ls -1 $BACKUP | grep cleanup2_ro | wc -w" 2
sleep 1


# end of test suite
assert_end "btrfs-subvolume-backup cleanup tests"
