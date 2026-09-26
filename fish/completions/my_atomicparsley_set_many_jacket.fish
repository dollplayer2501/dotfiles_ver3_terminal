#
#
#

complete --command my_atomicparsley_set_many_jacket --erase
complete --command my_atomicparsley_set_many_jacket --no-files

complete --command my_atomicparsley_set_many_jacket -n '__fish_is_nth_token 1' \
  --arguments '(__fish_complete_directories)' \
  --description 'Directory'

complete --command my_atomicparsley_set_many_jacket -n '__fish_is_nth_token 2' \
  --arguments '(
    set -l dir (commandline -opc)[2]
    if test -d "$dir"
      find "$dir" -maxdepth 1 \
        -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \
        | string replace -r "^$dir/?" ""
      end
  )' \
  --description 'Image file, jpg or png'
