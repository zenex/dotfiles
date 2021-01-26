# ─┐ ┬┌─┐┌┐┌┌─┐┌┐ ┬ ┬┌┬┐┌─┐ ─┐ ┬┬ ┬┌─┐
# ┌┴┬┘├┤ ││││ │├┴┐└┬┘ │ ├┤  ┌┴┬┘└┬┘┌─┘
# ┴ └─└─┘┘└┘└─┘└─┘ ┴  ┴ └─┘o┴ └─ ┴ └─┘
# Author:  SENEX @ XENOBYTE.XYZ
# License: MIT License
# Website: https://xenobyte.xyz/projects/?nav=dotfiles

#!/bin/bash

set +e

# CHANGE TO YOUR OWN GIT CLONE DIR OF PREFERENCE
backup_dir="/home/$USER/repos/dotfiles/"

echo "--- DOTFILES BACKUP SCRIPT V.1 ---"
echo "--- Visist XENOBYTE.XYZ 4more ---"
echo "Backing data to: ${backup_dir}"
echo "Creating folders..."

if [ ! -d "$backup_dir" ]; then
    echo "Backup folder not found, creating a new one..."
    # MAKE DIRECTORIES
    mkdir -p "${backup_dir}"
    mkdir -p "${backup_dir}/terminal/"
    mkdir -p "${backup_dir}/terminal/fonts/"
    cd "${backup_dir}"
else
    echo "Backup folder found, starting backup"
    cd "${backup_dir}"
fi

# AWESOME WM
echo "AwesomeWM..."
cp -r ~/.config/awesome/ "$backup_dir/"

# TERMINAL AND COLORS
echo "Terminal files..."
cp ~/.Xresources "${backup_dir}/terminal/"
cp ~/.tmux.conf  "${backup_dir}/terminal/"
cp -r ~/.tmux/  "${backup_dir}/terminal/"
cp ~/.zshrc  "${backup_dir}/terminal/"
cp -r ~/.urxvt/  "${backup_dir}/terminal/"
cp -r ~/.ncmpcpp "${backup_dir}/terminal/"
rm "${backup_dir}/terminal/.ncmpcpp/error.log"

echo "Fonts..."
cp -r ~/.fonts/ProFontWindows.ttf  "${backup_dir}/terminal/fonts/"
cp -r ~/.fonts/ohsnap-otb/  "${backup_dir}/terminal/fonts/"
cp -r ~/.fonts/tewi-medium-11.otb  "${backup_dir}/terminal/fonts/"
cp -r ~/.fonts/TerminalVector.ttf  "${backup_dir}/terminal/fonts/"
cp -r ~/.scripts/ "${backup_dir}/terminal/"
rm "${backup_dir}/terminal/.scripts/weather.sh"

cd "${backup_dir}"
inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

if [ "$inside_git_repo" ]; then
    echo "Git repository found."
    echo "Updating local git repository..."
    git add .
    git commit -m "$(date +%F_%T) - COMMIT AUTOMATICALLY ADDED BY BACKUP_DOTFILES.SH, CHECK CHANGELOG.ORG FOR UPDATES"
    git commit
    git checkout
else
    echo "Git repository NOT found."
    echo "Creating a new git repository..."
    echo "Updating new local git repository..."
    touch "${backup_dir}/README.org"
    touch "${backup_dir}/CHANGELOG.org"
    git init
    git add .
    git commit -m "$(date +%F_%T)"
    # git commit
    git checkout
fi


echo "Backup complete."

