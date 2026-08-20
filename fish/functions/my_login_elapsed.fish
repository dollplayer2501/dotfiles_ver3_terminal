#
#
#
function my_login_elapsed --description "`last -1 -F $USER` and retrieve the time elapsed since login (normalized or in seconds)."

  # The result is automatically stored in the `_flag_second` variable.
  argparse 'second' -- $argv
    or return 1

#  set --local login (last -1 $USER | awk 'NR==1{print $5, $6, $7}')
  set --local login (last -1 -F $USER | awk 'NR==1{print $4, $5, $6, $7, $8}')

  set --local login_epoch (date -d "$login" +%s)
  set --local now_epoch (date +%s)
  set --local diff (math $now_epoch - $login_epoch)

  if set -q _flag_second
    echo $diff
  else
    printf "%s hours %s minutes %s seconds since login\n" \
      (math --scale=0 $diff / 3600) \
      (math --scale=0 $diff % 3600 / 60) \
      (math --scale=0 $diff % 60)
  end
end
