#!/usr/bin/env fish

set --local ini_file ~/.local/bin/my_backupping5.ini
__my_function_load_ini "$ini_file"
if test $status -ne 0
  return 1
end
echo $backup_path_public
echo $backup_path_hidden


echo (date) > $backup_path_public/hoge_public.txt
echo (date) > $backup_path_hidden/hoge_hidden.txt
git add $backup_path_public/hoge_public.txt


#
# Low level Japanese settings/configurations
#

command cp /etc/default/keyboard $backup_path_public
command cp /etc/X11/xorg.conf.d/00-keyboard.conf $backup_path_public
# command cp /etc/X11/xorg.conf.d/20-keyboard.conf $backup_path_public


#
# public
#

command fc-list : family | sort -u | grep -v "Noto" > $backup_path_public/fc-list.txt
git add $backup_path_public/fc-list.txt

command cp ~/.Xresources $backup_path_public
git add $backup_path_public/.Xresources

command cp ~/.xprofile $backup_path_public
git add $backup_path_public/.xprofile


#
# hidden
#

command cp ~/.gitconfig $backup_path_hidden


#
# With the understanding that I will ultimately migrate to "dotfiles_ver3_window-manager"
#

command cp ~/.config/Code\ -\ OSS/User/settings.json $backup_path_public/settings.json
command cp ~/.config/user-dirs.dirs $backup_path_public
command cp ~/.config/user-dirs.locale $backup_path_public

command ls -la ~/.local/share/icons/ > $backup_path_public/local_share_icons.txt
command ls -la ~/.local/share/fonts/ > $backup_path_public/local_share_fonts.txt
command ls -la ~/.local/share/themes/ > $backup_path_public/local_share_themes.txt

git add $backup_path_public/settings.json
git add $backup_path_public/user-dirs.dirs
git add $backup_path_public/user-dirs.locale
git add $backup_path_public/local_share_icons.txt
git add $backup_path_public/local_share_fonts.txt
git add $backup_path_public/local_share_themes.txt

