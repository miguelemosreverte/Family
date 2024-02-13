#!/bin/bash

# Dynamically get the current script's directory to use as the repo path
REPO_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define the cron job command, pulling from the main branch. Adjust the branch name if necessary.
CRON_JOB="*/5 * * * * cd $REPO_PATH && git pull origin main > /dev/null 2>&1"

# Check if the cron job already exists, and if not, add it
(crontab -l 2>/dev/null | grep -Fq "$CRON_JOB") || (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

# Inform the user
echo "Cron job to update the repo every 5 minutes has been set up successfully."
