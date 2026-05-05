#
#
#

function my_mv_and_ln

  if test (count $argv) -ne 2
    echo "Usage: my_mv_and_ln <source_dir> <dest_dir>"
    return 1
  end

  for idx in (seq 2)
    if not test -d $argv[$idx]
      echo "Error:" $argv[$idx] "is does not directory!"
      return 1
    end
  end

  set --local src_full (realpath $argv[1])
  set --local dst_full (realpath $argv[2])
  echo $src_full
  echo $dst_full

  set --local src_base (basename $src_full)
  set --local src_to_dst_full (string join / $dst_full $src_base)
  echo $src_to_dst_full

  set --local src_path (dirname $src_full)
  echo $src_path

  #
  #
  #

  command mv $src_full $dst_full
  if test $status -ne 0
    echo "Error: mv failed."
    return 1
  end

  command ln -s $src_to_dst_full $src_path
  if test $status -ne 0
    echo "Error: ln -s failed."
    return 1
  end
end
