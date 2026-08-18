#
# NOTE:
#  This script references an external file (an .ini file) for settings such as mount points.
#

function my_mount_nas --description "Mount NAS."
  set --local ini_file ~/.config/fish/conf.d/ini/my_mount_nas.ini

  for line in (cat $ini_file)
    set key (string split -m1 '=' $line)[1]
    set val (string split -m1 '=' $line)[2]
    set $key $val
  end
  # echo $mount_device
  # echo $mount_point
  # return

  set --local message_tips "If NAS mount is unnecessary, execute `sudo umount $mount_point`"

  if mountpoint -q $mount_point
    echo (set_color green)"NAS already mounted"(set_color normal)
    echo (set_color green)$message_tips(set_color normal)
    return 0
  end

  echo (set_color yellow)"Need NAS mount, $mount_device $mount_point"(set_color normal)
  set_color red
  sudo mount -t nfs $mount_device $mount_point
  set_color normal

  echo (set_color green)$message_tips(set_color normal)
end
