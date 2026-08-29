#
# NOTE:
#  This script references a separate file (an INI file) for the wallpaper.
#

function my_wallpaper_set_default --description "Force the wallpaper provided by the distribution to be set."

  set --local ini_file ~/.config/fish/conf.d/ini/my_wallpaper_set_default.ini

  # Check for the existence of the ini file
  if not test -f $ini_file
    echo (set_color red)"INI file not found: $ini_file"(set_color normal) >&2
    echo (set_color red)"Refer to the sample ini file in this directory."(set_color normal)
    return 1
  end

  # Loading an ini file and setting keys and values
  for line in (cat $ini_file)
    set key (string split -m1 '=' $line)[1]
    set val (string split -m1 '=' $line)[2]
    set $key $val
  end
  echo (set_color green)"Set wallpaper, $default_wallpaper"(set_color normal)

  # Use `feh` to set the wallpaper.
  command feh --no-fehbg --bg-fill $default_wallpaper

end
