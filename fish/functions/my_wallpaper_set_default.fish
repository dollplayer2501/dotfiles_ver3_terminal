#
# NOTE:
#  This script references a separate file (an INI file) for the wallpaper.
#

function my_wallpaper_set_default --description "Force the wallpaper provided by the distribution to be set."

  set --local ini_file ~/.config/fish/conf.d/ini/my_wallpaper_set_default.ini
  __my_function_load_ini "$ini_file"
  if test $status -ne 0
    return 1
  end

  if not set -q default_wallpaper; or test -z "$default_wallpaper"
    echo "The variable `default_wallpaper` does not exist or is empty." >&2
    return 1
  end

  echo (set_color green)"Set wallpaper, $default_wallpaper"(set_color normal)

  # Use `feh` to set the wallpaper.
  command feh --no-fehbg --bg-fill $default_wallpaper

end
