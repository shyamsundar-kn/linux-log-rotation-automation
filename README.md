# linux-log-rotation-automation
Automated Linux log rotation and cleanup solution using Bash scripting to prevent disk space issues in production servers.

# Linux Log Rotation Automation

A Bash-based log rotation solution for Linux production servers.

## Problem Statement

Application logs continuously grow and consume disk space, leading to:

- Server storage exhaustion
- Application failures
- Deployment issues
- Performance degradation

This script automates:

- Log rotation
- Log compression
- Retention management

## Features

- Configurable log size threshold
- Timestamp-based log archiving
- Automatic gzip compression
- Retention policy cleanup
- Cron job integration

## Repository Structure

```text
linux-log-rotation-automation/
├── scripts/
├── config/
├── docs/
└── README.md
```

## Configuration

Update:

```bash
config/app.conf
```

Example:

```bash
LOG_DIR="/var/log/myapp"
LOG_FILE="/var/log/myapp/app.log"
MAX_SIZE_MB=100
RETENTION_DAYS=7
```

## Usage

Give execution permission:

```bash
chmod +x scripts/log_rotate.sh
```

Run:

```bash
cd scripts
./log_rotate.sh
```

## Cron Scheduling

Edit crontab:

```bash
crontab -e
```

Add:

```bash
0 0 * * * /path/to/scripts/log_rotate.sh >> /tmp/logrotate.log 2>&1
```

This executes daily at midnight.

## Sample Workflow

Before:

```text
app.log = 250 MB
```

After rotation:

```text
app.log
app_20260624_120000.log.gz
```

## Technologies Used

- Linux
- Bash Shell Scripting
- Cron
- Gzip

## Author

Shyam Sundar K N
DevOps Engineer
