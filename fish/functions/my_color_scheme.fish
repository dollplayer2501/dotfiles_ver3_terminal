#
#
#

function my_color_scheme --description "Display my color scheme, using EndeavourOS, Xfce4."
  #
  function __hex_to_rgb
    set --local hexx (string sub --start 2 $argv[1]) # "#rrggbb" to "rrggbb"

    set --local rrx (string sub --start 1 --length 2 $hexx) # "rr"____
    set --local ggx (string sub --start 3 --length 2 $hexx) # __"gg"__
    set --local bbx (string sub --start 5 --length 2 $hexx) # ____"bb"

    set --local rrz (math "0x$rrx")
    set --local ggz (math "0x$ggx")
    set --local bbz (math "0x$bbx")

    printf "  \033[38;2;%d;%d;%dm%-14s\033[0m  HEX:#%s  RGB:(%3d,%3d,%3d)\n" \
      $rrz $ggz $bbz \
      "01234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" \
      $hexx \
      $rrz $ggz $bbz
  end

  ###

  echo (set_color brgreen --bold)'EndeavourOS, Xfce4'(set_color normal)

  set --local my_array "#08052b" "#221f45" "#7f3fbf" "#7f7fff" "#7fbaff" "#9999cc" "#cc3980" "#cdccdb" "#e3e3ea" "#ff7f7f"
  for color16 in $my_array
    __hex_to_rgb $color16
  end

  ###

  echo (set_color brgreen --bold)'Lava color scheme for the Fish shell'(set_color normal)

  set --local my_array "#00a6b2" "#a63100" "#bf5b30" "#bf9c30" "#ff4c00" "#ff9400" "#ffc000" "#ffc473" "#ffdd73"
  for color16 in $my_array
    __hex_to_rgb $color16
  end

  ###

  echo (set_color brgreen --bold)'A typical "Lava" color scheme'(set_color normal)

  set --local my_array "#1a1a1a" "#342331" "#e9d6d8" "#cf1020" "#ec753a" "#f1e25f" "#00f8e4"
  for color16 in $my_array
    __hex_to_rgb $color16
  end

  ###

  echo (set_color brgreen --bold)'The color scheme of the WordPress "Hexa" theme that I previously used on my website'(set_color normal)

  set --local my_array "#6a524a" "#7cbbbb" "#97756a" "#a69e8d" "#d25349" "#d2c38e" "#e9e7e3"
  for color16 in $my_array
    __hex_to_rgb $color16
  end

end
