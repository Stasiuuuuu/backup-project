# Backup Pipeline Automation

A Linux backup automation project built with Bash and integrated with Jenkins CI.

The project automates file backups, validates generated archives, logs execution results, and runs automated tests through a Jenkins Declarative Pipeline.

## Features

- Automated backups — creates compressed `.tar.gz` archives.
- Archive validation — checks generated archives using `tar`.
- Error handling — handles missing files and missing arguments.
- Logging — records backup results and errors with timestamps.
- Automated testing — verifies successful backups and expected failure scenarios.
- CI integration — Jenkins runs tests before executing the backup stage.
- Makefile — provides simple commands for common tasks.

## Technologies

- Linux / Ubuntu
- Bash
- Git and GitHub
- Jenkins
- Make
- GNU tar

## Prerequisites

The project requires:

- Bash
- GNU tar
- GNU Make
- Standard Linux command-line utilities

Jenkins is required to execute the CI pipeline.

# Usage

# Create a backup

From the project root, run:

(bash)
make backup FILE=scripts/test.txt


The script creates a timestamped compressed archive in the project's `backups/` directory.

# Run tests

(bash)
make test


The test suite checks:

- Successful backup execution
- Rejection of a nonexistent input file
- Rejection of a missing filename argument

# Jenkins Pipeline

The Jenkins Declarative Pipeline contains two stages:

1. Test — runs `make test`.
2. Backup — runs `make backup FILE=scripts/test.txt`.

Jenkins checks out the project from GitHub and executes the pipeline on its configured agent.

# Logging

Backup execution results are recorded in:

(text)
logs/backup.log

Logs include timestamps, operation results, and error messages.

# Current Limitations

- Backups are stored in the project workspace by default.
- Backup retention and automatic cleanup are not implemented.
- Automated scheduling and GitHub webhook triggers are not configured.
- Backup restoration has not yet been implemented as a separate tested workflow.

## Future Improvements

- Publish backup archives as Jenkins build artifacts.
- Configure scheduled backups.
- Add backup retention and cleanup policies.
- Implement and test archive restoration.
- Add Docker support for a reproducible execution environment.

## Project Status

A learning project demonstrating Linux scripting, backup automation, automated testing, Git version control, and Jenkins CI integration.
