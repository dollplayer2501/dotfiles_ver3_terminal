#
#
#
function my_login_elapsed
  
  set --local argv1 ''
  if test (count $argv) -eq 0
    set argv1 'default'
  end

#  set --local login (last -1 $USER | awk 'NR==1{print $5, $6, $7}')
  set --local login (last -1 -F $USER | awk 'NR==1{print $4, $5, $6, $7, $8}')

  set --local login_epoch (date -d "$login" +%s)
  set --local now_epoch (date +%s)
  set --local diff (math $now_epoch - $login_epoch)


  if test 'default' = $argv1
    printf "%02d:%02d:%02d" \
      (math --scale=0 $diff / 3600) \
      (math --scale=0 $diff % 3600 / 60) \
      (math --scale=0 $diff % 60)
  else
    printf "%s hours %s minutes %s seconds since login\n" \
      (math --scale=0 $diff / 3600) \
      (math --scale=0 $diff % 3600 / 60) \
      (math --scale=0 $diff % 60)
  end
end
