#
# This is template
#
#  1. Specify a directory as an argument.
#  2. Retrieve each file in that directory one by one.
#  3. Convert the file to its full path.
#

function my_loop_function_template

  if test (count $argv) -ne 1
    echo "Usage: func_hoge <directory>" >&2
    return 1
  end

  set --local dir $argv[1]

  if not test -d $dir
    echo "Error: '$dir' is not a directory." >&2
    return 1
  end

  for file in $dir/*.m4a
    # Only files are targeted (subdirectories are excluded).
    if test -f $file
      # Convert to full path
      set fullpath (realpath $file)
      echo $fullpath
    end
  end
end
