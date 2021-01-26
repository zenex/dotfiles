# ─┐ ┬┌─┐┌┐┌┌─┐┌┐ ┬ ┬┌┬┐┌─┐ ─┐ ┬┬ ┬┌─┐
# ┌┴┬┘├┤ ││││ │├┴┐└┬┘ │ ├┤  ┌┴┬┘└┬┘┌─┘
# ┴ └─└─┘┘└┘└─┘└─┘ ┴  ┴ └─┘o┴ └─ ┴ └─┘
# Author:  SENEX @ XENOBYTE.XYZ
# License: MIT License
# Website: https://xenobyte.xyz/projects/?nav=dotfiles

#!/bin/bash

set +e

# CHANGE TO YOUR OWN GIT CLONE DIR
repo_dir="/home/$USER/repos/hexmacs/"

echo "Updating: ${repo_dir}"

mkdir -p "${repo_dir}"
mkdir -p "${repo_dir}.emacs.d"

cd "${repo_dir}"
echo "Backing files."


# EMACS
cp ~/.emacs "${repo_dir}/"
cp ~/.emacs.d/hexmacs-packages.el "${repo_dir}/.emacs.d"
cp -r ~/.emacs.d/custom/ "${repo_dir}.emacs.d/"
# CLEAN AUTO GENERATED FILES
cd "${repo_dir}/hexmacs/.emacs.d/custom/"
# Delete temporary files
find . -name "*.elc" -delete
find . -name "*.el#" -delete
find . -name "*.el~" -delete

cd "${repo_dir}"
inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

if [ "$inside_git_repo" ]; then
    echo "Git repository found."
    echo "Updating local git repository..."
    git add .
    git commit -m "$(date +%F_%T) - COMMIT AUTOMATICALLY ADDED BY BACKUP_HEXMACS.SH, CHECK CHANGELOG.ORG FOR UPDATES"
    git commit
    git checkout
else
    echo "Git repository NOT found."
    echo "Creating a new git repository..."
    echo "Updating new local git repository..."
    touch "${repo_dir}/README.org"
    touch "${repo_dir}/CHANGELOG.org"
    git init
    git add .
    git commit -m "$(date +%F_%T)"
    git commit
    git checkout
fi


echo "Backup complete."
