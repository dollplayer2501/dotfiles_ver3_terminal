#
#
#

complete --command my_extract --erase

complete --command my_extract \
  --arguments "(__fish_complete_path --files)" \
  --require-parameter \
  --force-files \
  --description "Input archive file"

