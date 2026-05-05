#
#
#


set --universal --export EDITOR nvim
set --universal --export VISUAL nvim
set --universal --export TERMCMD kitty


#
# When switching from Ranger to the shell, "S",
# "RANGER > " is displayed on the Starship command line.
#
# NOTE: Need Ranger setting
#  in `rc.conf``
#   map S shell RANGER_SHELL=1 $SHELL
#

if set -q RANGER_SHELL
  set -x STARSHIP_SHELL_INDICATOR 'RANGER > '
else
  set -x STARSHIP_SHELL_INDICATOR ''
end
