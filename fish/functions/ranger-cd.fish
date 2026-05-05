#
#
#

function ranger-cd --description "Change to the directory where Ranger exited."
  set tmpfile (mktemp -t ranger_cd.XXXXXX)

  command ranger --choosedir=$tmpfile $argv

  if test -s $tmpfile
    set target (cat $tmpfile)
    if test -d "$target"
      cd "$target"
    end
  end

  rm -f $tmpfile
end
