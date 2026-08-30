#
#
#

complete --command my_wallpaper_set_one_color --erase

complete --command my_wallpaper_set_one_color \
  --short-option h --long-option help \
  --description 'Show help'

# NOTE:
#  In the case of the description below, candidates are displayed.
#  --arguments "\#08052b \#221f45 \#7f3fbf \#7f7fff \#7fbaff \#9999cc \#cc3980 \#ff7f7f" \

complete --command my_wallpaper_set_one_color \
  --short-option c --long-option color \
  --require-parameter \
  --no-files \
  --description 'Set color'

complete --command my_wallpaper_set_one_color \
  --short-option s --long-option size \
  --require-parameter \
  --no-files \
  --description 'Set size'
