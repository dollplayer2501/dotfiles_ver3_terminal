#
#
#

function my_color_now --description "Display ANSI 0 to 15 color code."

  set color_names black red green yellow blue magenta cyan white

  echo "Color0–color15 preview"
  echo "----------------------"

  for i in (seq 0 15)
    set base (math "$i % 8")
    set name $color_names[(math "$base + 1")]
    if test $i -ge 8
      set variant bright
    else
      set variant normal
    end
    printf "color%-2d (%-7s %-6s)  " $i $name $variant

    # Foreground
    # printf "color%-2d fg: \e[38;5;%dm██████\e[0m  " $i $i
    printf "color%-2d fg: \e[38;5;%dm01234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\e[0m  " $i $i

    # background
    printf "bg: \e[48;5;%dm      \e[0m\n" $i
  end
end
