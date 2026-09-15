#!/usr/bin/env fish

# set --local script_dir (dirname (status --current-filename))
# echo $script_dir

# set --local ini_file /home/dollplayer/Projects/dotfiles_ver3_terminal/_bin/my_backupping5.ini
set --local ini_file ~/.local/bin/my_backupping5.ini
__my_function_load_ini "$ini_file"
if test $status -ne 0
  return 1
end
# echo $backup_path_public
# echo $backup_path_hidden

echo (date) > $backup_path_public/hoge_public.txt
echo (date) > $backup_path_hidden/hoge_hidden.txt

git add $backup_path_public/hoge_public.txt
