#
#
#

complete --command my_fish_history_delete_contains --erase
complete --command my_fish_history_delete_contains \
  --no-files \
  --condition "not __fish_seen_argument" \
  --description "Pattern string"
