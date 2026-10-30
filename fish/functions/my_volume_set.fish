#
# A strictly personal script with no frills.
# Sometimes the volume drops after a package update.
#
# Force the volume to 100%.
# Nothing else is acceptable.
#

function my_volume_set -d ""

  #
  # TODO: 2026-10-30
  #   By using an .ini file, it becomes possible to set a custom volume level for each command.
  #

  #
  # TODO: 2026-10-30
  #   Should we combine settings and display into a single command, using arguments to distinguish between them?
  #

  # No message is issued after this command is executed.
  command wpctl set-volume @DEFAULT_SINK@ 100%
  #
  command amixer -c 1 sset Master 100%

end
