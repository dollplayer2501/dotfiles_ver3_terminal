#
# A strictly personal script with no frills.
# Sometimes the volume drops after a package update.
#

function my_volume_get -d "Get the volume levels, I don't really understand."

  echo (set_color green)'wpctl get-volume @DEFAULT_SINK@'(set_color normal) >&2
  command wpctl get-volume @DEFAULT_SINK@

  # echo (set_color green)'wpctl status'(set_color normal) >&2
  # command wpctl status

  echo (set_color green)'pactl get-sink-volume @DEFAULT_SINK@'(set_color normal) >&2
  command pactl get-sink-volume @DEFAULT_SINK@

  echo (set_color green)'amixer -c 1 sget Master'(set_color normal) >&2
  command amixer -c 1 sget Master

end
