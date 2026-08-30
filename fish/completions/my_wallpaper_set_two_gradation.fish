#
#
#

complete --command my_wallpaper_set_two_gradation --erase

complete --command my_wallpaper_set_two_gradation \
  --short-option h --long-option help \
  --description 'Show help'

complete --command my_wallpaper_set_two_gradation \
  --long-option color1 \
  --require-parameter \
  --no-files \
  --description 'Set color1'

complete --command my_wallpaper_set_two_gradation \
  --long-option color2 \
  --require-parameter \
  --no-files \
  --description 'Set color2'

complete --command my_wallpaper_set_two_gradation \
  --short-option d --long-option direction \
  --require-parameter \
  --arguments "North South East West NorthWest NorthEast SouthWest SouthEast" \
  --no-files \
  --description 'Set direction'

complete --command my_wallpaper_set_two_gradation \
  --short-option s --long-option size \
  --require-parameter \
  --no-files \
  --description 'Set size'
