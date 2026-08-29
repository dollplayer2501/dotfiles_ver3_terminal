#
#
#

complete --command my_wallpaper_set_one_color --erase

complete --command my_wallpaper_set_one_color \
  --short-option h --long-option help \
  --description 'Show help'

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
