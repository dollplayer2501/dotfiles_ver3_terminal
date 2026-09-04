#
# A strictly personal script with no frills.
# Sometimes the volume drops after a package update.
#

function my_volume_get -d ""

  command wpctl get-volume @DEFAULT_SINK@
  command amixer -c 1 sget Master

end
