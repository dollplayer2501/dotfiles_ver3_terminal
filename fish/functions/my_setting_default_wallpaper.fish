#
# NOTE:
#  Note: This script references a separate file (an INI file) for the wallpaper.
#

function my_setting_default_wallpaper --description "Force the wallpaper provided by the distribution to be set."
  set --local ini_file ~/.config/fish/conf.d/ini/my_setting_default_wallpaper.ini

  for line in (cat $ini_file)
    set key (string split -m1 '=' $line)[1]
    set val (string split -m1 '=' $line)[2]
    set $key $val
  end
  echo (set_color green)"Wallpaper is $default_wallpaper"(set_color normal)

  command feh --no-fehbg --bg-fill $default_wallpaper

  #
  # NOTE:
  #  I use the Xorg environment by default, therefore, I'm using `feh`.
  #  If I need to differentiate from Wayland, I use conditional branching with `$XDG_SESSION_TYPE`.
  #
end
