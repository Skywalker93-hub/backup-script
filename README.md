# Archive Automation with Systemd

This project automates directory backup creation and transfer to a remote server.

## Features

- Creates a compressed `.tar.gz` archive of the target directory.
- Runs automatically using a `systemd` timer.
- Checks remote server availability via SSH.
- Transfers backups to a remote server using SCP.
- Uses `sshpass` for non-interactive authentication.

## Technologies

- Bash
- Systemd (service and timer)
- SSH / SCP
- Tar
