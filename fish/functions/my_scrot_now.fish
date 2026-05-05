#
#
#

function my_scrot_now -d "Scrot now."
  #
  # NOTE: Prerequisites:
  # - For a two-page monitor
  # - The resolution must be the same (1920x1080)
  # - Main is left (=1), sub is right (=2)
  #

  set --local my_distro   (grep -oP '(?<=PRETTY_NAME=").*(?=")' /etc/os-release)
  set --local my_desktop  (string upper (string sub -l 1 $DESKTOP_SESSION))(string sub -s 2 $DESKTOP_SESSION)
  set --local my_hostname (string upper (string sub -l 1 (hostname -s)))(string sub -s 2 (hostname -s))

  set --local year  (date +%Y)
  set --local month (math (date +%m))
  set --local day   (math (date +%d))
  set --local hour  (math (date +%H))
  set --local min   (math (date +%M))
  set --local sec   (math (date +%S))

  set --local filename_base_1 (printf "%s_%s_%s" $my_hostname $my_distro $my_desktop)
  set --local filename_base_2 (printf "%04d-%02d-%02d_%02d-%02d-%02d" $year $month $day $hour $min $sec)

  set --local screenshot_path ~/Pictures
  set --local filename_10 (printf "%s_%s.png"   $filename_base_1 $filename_base_2)
  set --local filename_20 (printf "%s_%s_0.png" $filename_base_1 $filename_base_2)
  set --local filename_21 (printf "%s_%s_1.png" $filename_base_1 $filename_base_2)
  set --local filename_22 (printf "%s_%s_2.png" $filename_base_1 $filename_base_2)

  # Is it a multi-monitor setup?
  set --local line (xrandr --listmonitors | head -n 1)
  set --local parts (string split ' ' $line)
  set --local monitors $parts[2]

  if test "2" = "$monitors"
    command scrot                               --silent --pointer $screenshot_path/$filename_20
    command scrot --autoselect    0,0,1920,1080 --silent --pointer $screenshot_path/$filename_21
    command scrot --autoselect 1920,0,1920,1080 --silent --pointer $screenshot_path/$filename_22
  else
    command scrot                               --silent --pointer $screenshot_path/$filename_10
  end
end
