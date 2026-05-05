#
#
#

complete --command my_magick_resize --erase

complete --command my_magick_resize \
  --short-option i --long-option input \
  --arguments "(__fish_complete_path --files)" \
  --require-parameter \
  --force-files \
  --description "Input image file"

complete --command my_magick_resize \
  --short-option r --long-option resize \
  --arguments "40% 1920x x1080 1920x1080" \
  --require-parameter \
  --no-files \
  --description "Resize image string"

complete --command my_magick_resize \
  --short-option t --long-option rotate \
  --arguments "-90 90" \
  --no-files \
  --description "roTate image string"

complete --command my_magick_resize \
  --short-option o --long-option output \
  --arguments "(__fish_complete_path --files)" \
  --force-files \
  --description "Output file name"

complete --command my_magick_resize \
  --short-option h --long-option help \
  --description "Show help"
