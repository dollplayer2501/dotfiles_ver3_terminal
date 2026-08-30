#
# NOTE:
#  The `mktemp` options may differ slightly between macOS (BSD-based) and Linux (GNU-based).
#  This explanation considers **only** Linux (GNU-based) systems.
#  - Linux (GNU-based)
#    `set tmpfile (mktemp --suffix=.png)`
#  - macOS (BSD-based)
#    `set tmpfile (mktemp -t tmp.XXXXXX.png)`
#

function my_wallpaper_set_one_color --description "Create an image in a specified color and set it as the wallpaper."

  #
  # Load default setting
  #

  set --local ini_file ~/.config/fish/conf.d/ini/my_wallpaper_set_one_color.ini

  if not test -f $ini_file
    echo (set_color red)"INI file not found: $ini_file"(set_color normal) >&2
    echo (set_color red)"Refer to the sample ini file in this directory."(set_color normal)
    return 1
  end

  for line in (cat $ini_file)
    set key (string split -m1 '=' $line)[1]
    set val (string split -m1 '=' $line)[2]
    set $key $val
  end


  #
  # If no argument is specified, processing continues using the default value.
  #

  if test (count $argv) -eq 0
    #
    # NOTE:
    #  To display help when no arguments or argument values ​​are provided,
    #  include only the following description.
    #
    # set argv --help
    #

    read --local --prompt-str (set_color yellow)"Continue to proceed? $default_color and $default_size, [y/N]: "(set_color normal) answer
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

  set --local options 'h/help' 'c/color=' 's/size='
  argparse $options -- $argv; or return 1

  if set -q _flag_help
    echo (set_color green)"Usage: my_setting_color_wallpaper [-h|--help] [-c|--color color] [-s|--size size]"(set_color normal)
    echo (set_color green)"  If nothing is specified, color is set $default_color and size is set $default_size."(set_color normal)
    echo (set_color green)"  This setting references the value of $ini_file."(set_color normal)
    return 0
  end


  #
  # Confirm settings
  #

  set --local confirm_color $default_color
  set --local confirm_size  $default_size

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
