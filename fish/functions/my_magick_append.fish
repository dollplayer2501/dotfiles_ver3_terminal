#
#
#

function my_magick_append --description "Append images, portrait or landscape."

  set --local filename_inputs
  set --local filename_output ""
  set --local append_type "portrait"
  set --local gap_size 0
  set --local color "#ffffff"
  set --local show_help 0

  if test (count $argv) -eq 0
    set show_help 1
  end

  while test (count $argv) -gt 0
    switch $argv[1]

      case "-i" "--input"
        set argv $argv[2..-1]
        while test (count $argv) -gt 0; and not string match -q -- '-*' $argv[1]
          set --append filename_inputs $argv[1]
          set argv $argv[2..-1]
        end

      case "-t" "--type"
        set --local type_val (string lower $argv[2])
        if not contains -- $type_val portrait landscape
          echo (set_color red)"Error: -t/--type must be 'portrait' or 'landscape'"(set_color normal)
          set show_help 1
          break
        end
        set append_type $type_val
        set argv $argv[3..-1]

      case "-g" "--gap"
        if not string match -qr '^[0-9]+$' $argv[2]
          echo (set_color red)"Error: -g/--gap must be a number"(set_color normal)
          set show_help 1
          break
        end
        set gap_size $argv[2]
        set argv $argv[3..-1]

      case "-c" "--color"
        set color $argv[2]
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


  if test $show_help -eq 1
    echo (set_color green)"Usage: my_magick_appemd -i INPUT [-t TYPE] [-g GAP] -c [COLOR] -o OUTPUT"(set_color normal)
    echo (set_color green)" -t: 'portrait' or 'landscape', defalut 'portrait'"(set_color normal)
    echo (set_color green)" -g: Default 10"(set_color normal)
    echo (set_color green)" -c: Default `#ffffff`"(set_color normal)
    return 1
  end


  echo (set_color green)"inputs : $filename_inputs"(set_color normal)
  echo (set_color green)"count  : "(count $filename_inputs)(set_color normal)
  echo (set_color green)"type   : $append_type"(set_color normal)
  echo (set_color green)"gap    : $gap_size"(set_color normal)
  echo (set_color green)"color  : $color"(set_color normal)
  echo (set_color green)"output : $filename_output"(set_color normal)


  # NOTE:
  # Pay attention to the behavior of `base_size`.
  # This logic is clearly strange.
  # Switch the check to determine whether the vertical or horizontal dimensions fully match, depending on the orientation (landscape or portrait).

  set --local base_size (command identify -format "%wx%h" $filename_inputs[1])

  for filename in $filename_inputs
    set size (command identify -format "%wx%h" $filename)
#    if test "$size" != "$base_size"
#      echo (set_color red)"Error: Image size mismatch: $filename ($size) != $filename_inputs[1] ($base_size)"(set_color normal)
#      return 1
#    end
  end

  set --local width  (string split "x" $base_size)[1]
  set --local height (string split "x" $base_size)[2]

  echo (set_color yellow)"size   : $base_size"(set_color normal)
  echo (set_color yellow)"width  : $width"(set_color normal)
  echo (set_color yellow)"height : $height"(set_color normal)


  if test "0" != "$gap_size"
    set --local append_files
    # set tmp_file (mktemp --suffix=.jpg)
    set tmp_file (mktemp --suffix=.png)

    if test "$append_type" = "portrait"
      command magick -size "$width"x"$gap_size" xc:$color $tmp_file
    else
      command magick -size "$gap_size"x"$height" xc:$color $tmp_file
    end


    for i in (seq 1 (count $filename_inputs))
      set append_files $append_files $filename_inputs[$i]
      if test $i -lt (count $filename_inputs)
        set append_files $append_files $tmp_file
      end
    end


    if test "$append_type" = "portrait"
      command magick $append_files -append $filename_output
    else
      command magick $append_files +append $filename_output
    end

  else

    if test "$append_type" = "portrait"
      command magick $filename_inputs -append $filename_output
    else
      command magick $filename_inputs +append $filename_output
    end

  end

end
