#
#
#

function my_magick_resize --description "Resize and/or rotate image."

  set --local filename_input ""
  set --local resize_str ""
  set --local filename_output ""
  set --local rotate_str ""
  set --local show_help 0

  if test (count $argv) -eq 0
    set show_help 1
  end

  while test (count $argv) -gt 0
    switch $argv[1]
      case "-i" "--input"
        set filename_input $argv[2]
        set argv $argv[3..-1]
      case "-r" "--resize"
        set resize_str $argv[2]
        set argv $argv[3..-1]
      case "-t" "--rotate"
        set rotate_str $argv[2]
        set argv $argv[3..-1]
      case "-o" "--output"
        set filename_output $argv[2]
        set argv $argv[3..-1]
      case "-h" "--help"
        set show_help 1
        break
      case '*'
        echo "Unknown option: $argv[1]"
        set show_help 1
        break
    end
  end

  if test -z "$filename_input" -o -z "$resize_str"
    echo (set_color red)"Error: -i / --input and -r / --resize are required."(set_color normal)
    set show_help 1
  end

  if test $show_help -eq 1
    echo (set_color green)"Usage: my_magick_resize -i INPUT -r RESIZE  [-t ROTATE] [-o OUTPUT]"(set_color normal)
    echo (set_color green)"Example: my_magick_resize -i hoge.jpg -r 40% -t 90 -o hogeX.jpg"(set_color normal)
    return 1
  end

  if test -z "$filename_output"
    set --local resize_str_fixed (string replace "%" "percent" $resize_str)

    set --local file_basename  (basename $filename_input)
    set --local file_name      (string split -r -m1 . $file_basename)[1]
    set --local file_extension (string split -r -m1 . $filename_input)[2]
    set filename_output        (printf "%s__resize_%s.%s" $file_name $resize_str_fixed $file_extension)
  end

  set --local rotate_argument
  if test -n "$rotate_str"
    set rotate_argument "-rotate" $rotate_str
  end

  # set fish_trace 1
  command magick $filename_input -resize $resize_str $rotate_argument -strip $filename_output
  # set fish_trace 0
end
