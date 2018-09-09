#!/bin/sh

echo "Fetch GitHub public keys"
ruby fetch_github_public_keys.rb
echo "Adding public keys..."
ssh-copy-id -f -i ~/.ssh/public_keys.pub $1
echo "Delete created public keys"
rm ~/.ssh/public_keys.pub