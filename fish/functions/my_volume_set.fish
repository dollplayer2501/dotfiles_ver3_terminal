#
# A strictly personal script with no frills.
# Sometimes the volume drops after a package update.
#

function my_volume_set -d "Set the volume levels for wpctl and amixer independently, I don't really understand."

  if test (count $argv) -ne 2
    echo (set_color green)'Usage: my_volume_set <arg1> <arg2>'(set_color normal) >&2
    return 1
  end

  for arg in $argv
    if not string match -rq '^[0-9]+$' -- $arg
      echo (set_color red)'Error: Specify an integer.'(set_color normal) >&2
      return 1
    end

    if test $arg -lt 1 -o $arg -gt 100
      echo (set_color red)'Error: Specify a value in the range of 1 to 100.'(set_color normal) >&2
      return 1
    end
  end


  set --local wpctl_volume  (printf "%d%%" $argv[1])
  set --local amixer_volume (printf "%d%%" $argv[2])
  # echo $wpctl_volume,$amixer_volume


  # No message is issued after this command is executed.

  echo (set_color green)"wpctl set-volume @DEFAULT_SINK@ $wpctl_volume"(set_color normal) >&2
  command wpctl set-volume @DEFAULT_SINK@ $wpctl_volume
  #
  echo (set_color green)"amixer -c 1 sset Master $amixer_volume"(set_color normal) >&2
  command amixer -c 1 sset Master $amixer_volume
  #
end
