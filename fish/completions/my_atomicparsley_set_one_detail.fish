#
#
#

complete --command my_atomicparsley_set_one_detail --erase
complete --command my_atomicparsley_set_one_detail --no-files

complete --command my_atomicparsley_set_one_detail \
  --short-option i --long-option input \
  --arguments "(__fish_complete_path --files)" \
  --require-parameter \
  --force-files \
  --description "Input music file"

complete --command my_atomicparsley_set_one_detail \
  --long-option artist \
  --no-files \
  --description "Artist"

complete --command my_atomicparsley_set_one_detail \
  --long-option title \
  --no-files \
  --description "Title"

complete --command my_atomicparsley_set_one_detail \
  --long-option album \
  --no-files \
  --description "Album"

complete --command my_atomicparsley_set_one_detail \
  --long-option tracknum \
  --arguments "(seq 1 999)" \
  --no-files \
  --description "Tracknum"

complete --command my_atomicparsley_set_one_detail \
  --short-option h --long-option help \
  --description "Show help"

