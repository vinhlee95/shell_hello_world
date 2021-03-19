#!/bin/bash
# Script to deploy latest changes to remote master

master_branch="master"

# Fetch new changes from Git
echo "Fetch latest changes from Git in branch $master_branch"
git fetch

echo "Deploying latest changes to $master_branch $(git rev-parse --short origin/"$master_branch")"

echo "New changes compared to $master_branch branch on remote:"

echo

echo '```'
if git log origin/"$master_branch"..."$master_branch" --oneline | grep "." ; then
	true
fi
echo '```'

echo

# Confirm the action
read -r -p "⛔️⛔️⛔️ Are you sure? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        true
        ;;
    *)
        echo
        echo "💰💰💰 Not deploying, exiting."
        exit 2
        ;;
esac

# Pushing to master
echo "🛠🛠🛠 Deploying..."
git push origin origin/"$master_branch"

# Instruct check in Git repository
echo
echo "✅✅✅ Successfully deploy new changes to remote"
git config --get remote.origin.url

echo

echo "🥴🥴🥴 Happy breaking!"
