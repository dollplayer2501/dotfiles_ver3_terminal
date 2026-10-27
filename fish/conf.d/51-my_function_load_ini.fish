#
# Read the .ini file and set the variables.
#   A `#` at the beginning of a line is treated as a comment.
#   Ignore blank lines as well.
#

function __my_function_load_ini --description "Read the .ini file and set the variables."

  set --local ini_file $argv[1]

  if not string length -q -- $ini_file
    echo (set_color red)"Specify the .ini file."(set_color normal) >&2
    return 1
  end

  if not test -f $ini_file
    echo (set_color red)"INI file not found: $ini_file"(set_color normal) >&2
    echo (set_color red)"Refer to the sample ini file in this directory."(set_color normal) >&2
    return 1
  end


  for line in (cat $ini_file)
    # Comment line
    if string match -q '#*' -- $line
      continue
    end

    # Empty line
    if test -z "$line"
      continue
    end

    set key (string split -m1 '=' $line)[1]
    set val (string split -m1 '=' $line)[2]

    # It appears that this variable and its value will persist until the terminal is closed.
    set --global (string trim "$key") (string trim "$val")
  end

  return 0
end
