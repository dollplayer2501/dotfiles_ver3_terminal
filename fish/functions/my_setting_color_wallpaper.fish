#
# NOTE:
#  The `mktemp` options may differ slightly between macOS (BSD-based) and Linux (GNU-based).
#  This explanation considers **only** Linux (GNU-based) systems.
#  - Linux (GNU-based)
#    `set tmpfile (mktemp --suffix=.png)`
#  - macOS (BSD-based)
#    `set tmpfile (mktemp -t tmp.XXXXXX.png)`
#

function my_setting_color_wallpaper --description "Create an image in a specified color and set it as the wallpaper."

  #
  # Load default setting
  #

  set --local ini_file ~/.config/fish/conf.d/ini/my_setting_color_wallpaper.ini

  for line in (cat $ini_file)
    set key (string split -m1 '=' $line)[1]
    set val (string split -m1 '=' $line)[2]
    set $key $val
  end

  #
  # Check arguments
  #

  argparse 'c/color=' 's/size=' -- $argv
    or return 1

  set --local confirm_color $default_color
  set --local confirm_size  $default_size

  #
  # Confirm settings
  #

  if set -q _flag_color
    set confirm_color $_flag_color
  end
  if set -q _flag_size
    set confirm_size $_flag_size
  end
  echo (set_color green)"Wallpaper color is $confirm_color, size is $confirm_size"(set_color normal)


  #
  # Main Topic: Executing the Process
  #

  set tmpfile (mktemp --suffix=.png)
  command magick -size $confirm_size xc:$confirm_color $tmpfile
  command feh --no-fehbg --bg-fill $tmpfile
  command rm -f $tmpfile

end
