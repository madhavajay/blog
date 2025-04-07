# Add all changes to git
git add .

# Commit with a message including the current Unix datetime
commit_message="Updating blog $(date +%s)"
git commit -m "$commit_message"

# Push the changes to the remote repository
git push
