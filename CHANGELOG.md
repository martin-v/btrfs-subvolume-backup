# Changelog

## [unversioned](https://github.com/martin-v/btrfs-subvolume-backup/) (2016-XX-XX)
[Full Changelog](https://github.com/martin-v/btrfs-subvolume-backup/compare/0.1.0...HEAD)

- More specific pattern for delete old snapshots.
- Change date for snapshot names to ISO 8601.
- Fix inappropriate usage message.
- Because of single responsibility principle remove feature `--bckrot`.
- Switch to common command `flock` for locking.
- Bugfix: Script fails when source volume contains slashes.


## [0.1.0](https://github.com/martin-v/btrfs-subvolume-backup/tree/0.1.0) (2016-02-20)

- Import from http://marc.merlins.org/linux/scripts/btrfs-subvolume-backup
