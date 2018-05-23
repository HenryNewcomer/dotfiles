#!/bin/bash
#
# Description: Creates symlinks from ~/ to ~/dotfiles dir
# Author: Henry Newcomer

# An array of directories to create
#dirs_to_create=( ".config" ".config/i3/")
# An array of filenames (without the leading period)
files=( "gitconfig" "i3/config" "tmux.conf" "vimrc" "xmodmap" "zshrc" )
NEW_DOTFILES=$(dirname `pwd`)
OLD_DOTFILES="${HOME}/.dotfiles_old"

if [[ -d "${OLD_DOTFILES}" ]]; then
  echo "Entering $OLD_DOTFILES directory. Existing backups will be overwritten."
else
  echo "Creating $OLD_DOTFILES for backup of any existing dotfiles."
  mkdir -p $OLD_DOTFILES
fi

if [[ ! -d "${OLD_DOTFILES}" ]]; then
  echo "Could not create $OLD_DOTFILES -- Script was aborted!"
  exit 1
fi

cd $NEW_DOTFILES

echo "Moving existing dotfiles to $OLD_DOTFILES"

for file in "${files[@]}"; do
  # Only backup files if they exist and are either symbolic links,
  # or basic files
  if [[ -h "${HOME}/.${file}" || -e "${HOME}/.${file}" ]]; then
    mv -f "${HOME}/.${file}" "${OLD_DOTFILES}/.${file}"
  fi
  echo "Creating symlink to .${file} in home directory."
  ln -s "${NEW_DOTFILES}/.${file}" "${HOME}/.${file}"
done

echo -e "\nFinished!\n"
exit 0
