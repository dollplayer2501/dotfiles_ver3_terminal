#
#
#

function my_magick_duotone_many --description "Convert image to many duotone."

  # TODO: あるディレクトリ内のファイル群を同じデュオトーンにする

  if test (count $argv) -eq 0
    echo "Error: Need argument, input file name"
    return 1
  end

  #  foward    back
  set colors \
    "#6736dd" "#10c5f8" \
    "#7a004f" "#ff0028" \
    "#9f704f" "#ffea00" \
    "#3d3f4c" "#26b7a0" \
    "#005eac" "#f6cde1" \
    "#27184f" "#f56468" \
    "#000000" "#ff3066" \
    "#114845" "#65ffc3" \
    "#6a051f" "#ffd2a2" \
    "#b10d0e" "#ffedc2" \
    "#11133a" "#ffb9ff" \
    "#141416" "#04fcfc" \
    "#0b2a6b" "#e4b6b9" \
    "#05106d" "#d3485d" \
    "#571530" "#fb78ba" \
    "#571731" "#78fbd8" \
    "#a91c93" "#8ee3ff" \
    "#271651" "#8effbb" \
    "#08052b" "#ff7f7f" \
    "#08052b" "#7f7fff" \
    "#08052b" "#7f3fbf" \
    "#08052b" "#7fbaff" \
    "#08052b" "#cc3980" \
    "#cc3980" "#ff7f7f" \
    "#ff7f7f" "#7fbaff" \
    "#7f3fbf" "#ff7f7f" \
    "#7f7fff" "#ff7f7f"

  set length (count $colors)

  set --local filename_full $argv[1]
  set --local file_basename (basename $filename_full)
  set --local file_name (string split -r -m1 . $file_basename)[1]
  set --local file_extension (string split -r -m1 . $filename_full)[2]

  for ii in (seq 1 2 $length)
    set --local aa $ii
    set --local bb (math $ii + 1)

    set --local color_1_0 $colors[$aa]
    set --local color_1_1 (string sub --start 2 $color_1_0)
    set --local color_2_0 $colors[$bb]
    set --local color_2_1 (string sub --start 2 $color_2_0)

    set --local filename_output (printf "%s__duotone_%02d_%s_%s.%s" $file_name $aa $color_1_1 $color_2_1 $file_extension)

    # set fish_trace 1
    command magick $filename_full -colorspace gray -level +10% +level-colors "$color_1_0","$color_2_0" $filename_output
    # set fish_trace 0
  end
end
