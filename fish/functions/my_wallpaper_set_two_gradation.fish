#
# NOTE:
#  The `mktemp` options may differ slightly between macOS (BSD-based) and Linux (GNU-based).
#  This explanation considers **only** Linux (GNU-based) systems.
#  - Linux (GNU-based)
#    `set tmpfile (mktemp --suffix=.png)`
#  - macOS (BSD-based)
#    `set tmpfile (mktemp -t tmp.XXXXXX.png)`
#

function my_wallpaper_set_two_gradation --description "Create an image in a gradient of two specific colors and set it as the wallpaper."

  set --local direction_string "North, South, East, West, NorthWest, NorthEast, SouthWest, SouthEast"

  #
  # Load default setting
  #

  set --local ini_file ~/.config/fish/conf.d/ini/my_wallpaper_set_two_gradation.ini
  __my_function_load_ini "$ini_file"
  if test $status -ne 0
    return 1
  end

  if not set -q default_color_1; or test -z "$default_color_1"
    echo "The variable `default_color_1` does not exist or is empty." >&2
    return 1
  end

  if not set -q default_color_2; or test -z "$default_color_2"
    echo "The variable `default_color_2` does not exist or is empty." >&2
    return 1
  end

  if not set -q default_direction; or test -z "$default_direction"
    echo "The variable `default_direction` does not exist or is empty." >&2
    return 1
  end

  if not set -q default_size; or test -z "$default_size"
    echo "The variable `default_size` does not exist or is empty." >&2
    return 1
  end


  #
  # If no argument is specified, processing continues using the default value.
  #

  if test (count $argv) -eq 0
    read --local --prompt-str (set_color yellow)"Continue to proceed? $default_color_1 $default_color_2, $default_direction, $default_size, [y/N]: "(set_color normal) answer
    switch $answer
    case y Y yes YES
      echo (set_color yellow)"Continuing"(set_color normal)
    case '*'
      echo (set_color yellow)"Cancelled"(set_color normal)
      return 0
    end
  end


  #
  # Check arguments
  #

  set --local options 'h/help' 'color1=' 'color2=' 'd/direction=' 's/size='
  argparse $options -- $argv; or return 1

  if set -q _flag_help
    echo (set_color green) \
      "Usage: my_setting_color_wallpaper [-h|--help] [-c1|--color1 color] [-c2|--color2 color] [-d/--direction direction] [-s|--size size]" \
      (set_color normal)
    echo (set_color green) "Note:" (set_color normal)
    echo (set_color green) \
      " If nothing is specified, colors are $default_color_1 $default_color_2, direction is $default_direction, size is $default_size." \
      (set_color normal)
    echo (set_color green) \
      " -d/--direction takes the following values: $direction_string" \
      (set_color normal)
    echo (set_color green) \
      " This setting references the value of $ini_file." \
      (set_color normal)
    return 0
  end


  #
  # Confirm settings
  #

  set --local confirm_color_1 $default_color_1
  set --local confirm_color_2 $default_color_2
  set --local confirm_direction $default_direction
  set --local confirm_size $default_size

  if set -q _flag_color1
    set confirm_color_1 $_flag_color1
  end
  if set -q _flag_color2
    set confirm_color_2 $_flag_color2
  end
  if set -q _flag_direction
    set confirm_direction $_flag_direction
  end
  if set -q _flag_size
    set confirm_size $_flag_size
  end


  #
  # Check direction
  #

  if not contains (string lower $confirm_direction) \
     north south east west northwest northeast southwest southeast
    echo (set_color red)"Direction is invalid value."(set_color normal)
    echo (set_color red)"Specify one of the following values: $direction_string"(set_color normal)
    return 1
  end


  #
  # Main Topic: Executing the Process
  #

  echo (set_color green)"Wallpaper colors are $confirm_color_1 $confirm_color_2, direction is $confirm_direction, size is $confirm_size"(set_color normal)

  set tmpfile (mktemp --suffix=.png)
  command magick -size $confirm_size -define gradient:direction=$confirm_direction gradient:$confirm_color_1-$confirm_color_2 $tmpfile
  command feh --no-fehbg --bg-fill $tmpfile
  command rm -f $tmpfile

end
