#!/usr/bin/env fish

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


command fc-list : family | sort -u | grep -v "Noto" > $backup_path_public/fc-list.txt
git add $backup_path_public/fc-list.txt

