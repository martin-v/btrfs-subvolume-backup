. assert.sh --verbose
. assert-extras.sh


# No param, show help message
assert_startswith "btrfs-subvolume-backup" "Usage:"
# One param, show help message
assert_startswith "btrfs-subvolume-backup yxz" "Usage:"

# Param --help, show help message
assert_startswith "btrfs-subvolume-backup --usage" "Usage:"

# Param --usage, show help message
assert_startswith "btrfs-subvolume-backup --help" "Usage:"

# Param -h, show help message
assert_startswith "btrfs-subvolume-backup -h" "Usage:"


# end of test suite
assert_end "btrfs-subvolume-backup help tests"
